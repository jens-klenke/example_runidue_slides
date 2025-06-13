
1.      Open the Rmd file of MatrixReader or the project, to set the working directory.
2.      Render the document using the following code in the console instead of the "knit" button:
 
library(rmarkdown)
options(tinytex.clean = FALSE)
render("MatrixAlgebraWinter2024.Rmd")   # adapt "Winter2024" in command suitably