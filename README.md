# clerksmovies

## Minimum Viable Product (MVP)

CREATE:
------
* Create membership
* Create movie	
* Create rental

READ:
----
* Membership information
* List of movies
* Due date of movies

UPDATE:	
------
* Update whether membership is active/inactive 
* Update a movie rental 
* Update movie rental (multiple copies of movies)
		
DELETE:	
------
* Delete a membership
* Delete a movie

---

## Stretch Goals (SG)

1.	Member’s rental history
2.	Link to IMDB API and retrieve reviews and/or ratings
3.	Allow members to add their own rating
4.	Add graphics - welcome screen/clerks movie reference
5.	Add sound effects for different actions (rental, denied rentals, late fees, create membership)
6.  Add rewind (boolean) check

User Stories:
------------
1. 	As a member I want to know if a movie is available.
2. 	As a member I want to know if I my account is active/has late fees.
3. 	As a member I want to know how many (or which) movies I have rented
4.	As a movie clerk, I want to checkout a movie for a customer

---

## DOMAIN MODELLING
```
MEMBER(SHIP)
  |
 /|\
/ | \
RENTAL 
\ | /
 \|/
  |
MOVIE
```
---

#### MEMBERS:
* id (integer) 
* name (text)
* age (integer)
* active (boolean)

#### RENTAL:
* member_id (integer)
* movie_id (integer)
* rental_date (date-time)
* due_date (date-time)

#### MOVIE:
* id (integer)
* title (text)
* rating (integer)
* copies (integer)
