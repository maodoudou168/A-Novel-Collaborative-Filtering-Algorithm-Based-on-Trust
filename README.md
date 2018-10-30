# A-Novel-Collaborative-Filtering-Algorithm-Based-on-Trust
This repository gives the codes of my paper, in which I proposes a collaborative filtering algorithm based on trust

The algorithms consider user professionality, authority and recognition to generate the combined trust of a user. Making use of the combined trust, I further generate the direct trust between users; and by making use of trust propagation, indirect trust is calculated. The trust similarity combined the effect of direct and indirect trust is used to generate the final predicted ratings of all the items.

The dataset was from Epinions:
http://www.trustlet.org/epinions.html

Since the original data is extremely large, I extracted a subset to make sure the code can run normally.

Run the main.m file to run the code, parameters can be adjusted in the main.m.
