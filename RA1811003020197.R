# top 50 products compared with the vulnarabilities faced
library(robotstxt)
library(rvest)
paths_allowed(
  paths = c("https://www.cvedetails.com/top-50-products.php")
)

link  = "https://www.cvedetails.com/top-50-products.php"
library(xml2)
page = read_html(link)

product_name = page %>% html_nodes(".num+ td a") %>% html_text()
vendor_name = page %>% html_nodes("td:nth-child(3) a") %>% html_text()
product_type = page %>% html_nodes(".listtable td:nth-child(4)") %>% html_text()
no_of_vulnerablities = page %>% html_nodes(".num a") %>% html_text()
data1 = data.frame(product_name, vendor_name, product_type, no_of_vulnerablities)
view(data1)
# a plot representation to compare vulnerablities in the product type
library(ggplot2)
ggplot(data1 , aes(x = product_type)) + geom_bar() +
  theme_bw() +
  labs( y = "Count of total vulnerablities" , x = "product type" 
        ,title = "vulnerablity comparison on product type")
