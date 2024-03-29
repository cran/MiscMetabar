################################################################################
#' Calculate hill number and compute Tuckey post-hoc test
#' @description
#'
#' `r lifecycle::badge("maturing")`
#' Note that, by default, this function use a sqrt of the read numbers in the linear
#'   model in order to correct for uneven sampling depth.
#' @aliases hill_tuckey_pq
#' @inheritParams clean_pq
#' @param modality (required) the variable to test
#' @param silent (logical) If TRUE, no message are printing.
#' @param correction_for_sample_size (logical, default TRUE) This function
#'   use a sqrt of the read numbers in the linear model in order to
#'   correct for uneven sampling depth.
#' @return A ggplot2 object
#'
#' @export
#'
#' @author Adrien Taudière
#' @examples
#' data("GlobalPatterns", package = "phyloseq")
#' GlobalPatterns@sam_data[, "Soil_logical"] <-
#'   ifelse(GlobalPatterns@sam_data[, "SampleType"] == "Soil", "Soil", "Not Soil")
#' hill_tuckey_pq(GlobalPatterns, "Soil_logical")
hill_tuckey_pq <- function(
    physeq,
    modality,
    silent = TRUE,
    correction_for_sample_size = TRUE) {
  modality_vector <-
    as.factor(as.vector(unlist(unclass(physeq@sam_data[, modality]))))

  if (length(modality_vector) != dim(physeq@otu_table)[2]) {
    physeq@otu_table <- t(physeq@otu_table)
  }
  read_numbers <- apply(physeq@otu_table, 2, sum)

  physeq <- clean_pq(physeq,
    force_taxa_as_rows = TRUE,
    remove_empty_samples = FALSE,
    remove_empty_taxa = FALSE,
    clean_samples_names = FALSE,
    silent = silent
  )
  otu_hill <-
    vegan::renyi(t(physeq@otu_table),
      scale = c(0, 1, 2),
      hill = TRUE
    )

  hill_1 <- otu_hill$"0"
  hill_2 <- otu_hill$"1"
  hill_3 <- otu_hill$"2"

  if (correction_for_sample_size) {
    tuk1 <-
      stats::TukeyHSD(stats::aov(lm(hill_1 ~ sqrt(read_numbers))$residuals ~ modality_vector))
    tuk2 <-
      stats::TukeyHSD(stats::aov(lm(hill_2 ~ sqrt(read_numbers))$residuals ~ modality_vector))
    tuk3 <-
      stats::TukeyHSD(stats::aov(lm(hill_3 ~ sqrt(read_numbers))$residuals ~ modality_vector))
  } else {
    tuk1 <-
      stats::TukeyHSD(stats::aov(hill_1 ~ modality_vector))
    tuk2 <-
      stats::TukeyHSD(stats::aov(hill_2 ~ modality_vector))
    tuk3 <-
      stats::TukeyHSD(stats::aov(hill_3 ~ modality_vector))
  }

  df <-
    rbind(
      tuk1$modality_vector,
      tuk2$modality_vector,
      tuk3$modality_vector
    )
  df <-
    data.frame(
      df,
      "x" = paste(
        "Hill Number",
        c(
          rep("0", dim(
            tuk3$modality_vector
          )[1]),
          rep("1", dim(
            tuk3$modality_vector
          )[1]),
          rep("2", dim(
            tuk3$modality_vector
          )[1])
        ),
        rownames(tuk1$modality_vector)
      ),
      "modality" =
        rownames(tuk1$modality_vector)
    )

  p <- ggplot(data = df) +
    geom_linerange(aes(ymax = upr, ymin = lwr, x = x), linewidth = 2) +
    geom_point(aes(x = x, y = diff),
      size = 4,
      shape = 21,
      fill = "white"
    ) +
    coord_flip() +
    theme_gray() +
    geom_hline(yintercept = 0) +
    ylab("Differences in mean levels (value and confidence intervals at 95%)") +
    xlab("") +
    ggtitle("Results of the Tuckey HSD testing for differences
    in mean Hill numbers")

  return(p)
}
################################################################################
