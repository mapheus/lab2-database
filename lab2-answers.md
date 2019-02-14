Laboration 2
=======
## 4.
a) theater_name, title + year

b) Yes, theater name can change, just look at "Filmstaden". 

c) No

d) When you need more information to form a key, it may just be easier to form an invented key. Another reason can be when the natural key may change in the future.

## 6.
theater(_theater_name_, capacity)

performance(_performance_id_, start_time, /_theater_name_/, /_imdb_key_/)

movie(_imdb_key_, movie_name, production_year, running_time)

ticket(_t_id_, /_performance_id_/, /_username_/)

customer(_username_, full_name, password, /_t_id_/)

## 7.
If when the database is created, we create all the tickets with no user attached, one way to keep track of the number of free seats is to check if the ticket entity has a username attached to it.

Another way is to add the entity "Sold_tickets" that has a relation to Ticket and Theater...