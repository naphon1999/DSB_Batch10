library(RSQLite)

con <- dbConnect(SQLite(),"restaurant.db") 

dbWriteTable(con, "menu",
             data.frame(menu_id=1:4,
                        menu_names = c("pizza",
                                        "sandwich",
                                        "toast",
                                        "pasta"),
                        menu_price = c(18,8,11,15)))

dbWriteTable(con, "staff",
             data.frame(staff_id=1:4,
                        staff_names = c("marbel",
                                         "ingko",
                                         "bilkin",
                                         "pp"),
                        staff_position = c("cook",
                                            "waitress",
                                            "receptionist",
                                            "allrounder")))
dbListTables(con)
dbListFields(con, "menu")
dbGetQuery(con, "select * from menu")
dbRemoveTable(con, "menu")
dbDisconnect(con)
