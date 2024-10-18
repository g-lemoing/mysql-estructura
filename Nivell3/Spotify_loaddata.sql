use Spotify;

INSERT INTO artist (name, artist_picture) VALUES
('Love of Lesbian', 'path/love_of_lesbian.jpg'),
('Suu', 'path/suu.jpg'),
('Dire Straits', 'path/direstraits.jpg'),
('Cold Play', 'path/coldplay.jpg'),
('Imagine Dragons', 'path/imagine_dragons.jpg');

INSERT INTO artist_related_with  (artist_id, related_artist_id) VALUES
(1, 3), (1, 4), (2, 1), (4, 5), (4, 3);

INSERT INTO credit_card (card_nr, card_expireson, card_cvc) VALUES
('1234567812345678', '2030-12-31', '023'),
('1234555512345678', '2029-12-31', '323'),
('1234666612345678', '2030-07-31', '787'),
('1234333312345678', '2028-08-31', '987'),
('1234000012345678', '2024-12-31', '654');

insert into album (album_id, title, year_publishedon, cover_image, publishedby_artist_id) values
(1, 'title1', 2009, 'path/title1.jpg', 1),
(2, 'title2', 2019, 'path/title2.jpg', 2),
(3, 'title3', 2012, 'path/title3.jpg', 3),
(4, 'title4', 2009, 'path/title4.jpg', 4),
(5, 'title5', 1999, 'path/title5.jpg', 5),
(6, 'title6', 2017, 'path/title6.jpg', 1);

insert into song (title, duration, reproductions_qty, album_id) values
('title1', '00:47:02', 5, 1),
('title2', '00:47:02', 5, 1),
('title3', '00:47:02', 4, 1),
('title4', '00:47:02', 78, 1),
('title5', '00:47:02', 56, 1),
('title6', '00:47:02', 0, 1),
('title1', '00:47:02', 98, 2),
('title2', '00:47:02', 569, 2),
('title3', '00:47:02', 0, 2),
('title4', '00:47:02', 89, 2),
('title5', '00:47:02', 76, 2),
('title6', '00:47:02', 4, 2),
('title1', '00:47:02', 3, 3),
('title2', '00:47:02', 7, 3),
('title3', '00:47:02', 0, 3),
('title4', '00:47:02', 9, 3),
('title5', '00:47:02', 34, 3),
('title6', '00:47:02', 98, 3),
('title1', '00:47:02', 765, 4),
('title2', '00:47:02', 23, 4),
('title3', '00:47:02', 45, 4),
('title4', '00:47:02', 12, 4),
('title5', '00:47:02', 2, 4),
('title6', '00:47:02', 987, 4),
('title1', '00:47:02', 7776, 5),
('title2', '00:47:02', 456, 5),
('title3', '00:47:02', 655, 5),
('title4', '00:47:02', 878, 5),
('title5', '00:47:02', 8876, 5),
('title6', '00:47:02', 987, 5),
('title1', '00:47:02', 555, 6),
('title2', '00:47:02', 544, 6),
('title3', '00:47:02', 987, 6),
('title4', '00:47:02', 997, 6),
('title5', '00:47:02', 345, 6),
('title6', '00:47:02', 66, 6);

INSERT INTO playlist (playlist_title, songs_qty, createdon, user_id) values
('playlist1', 34, '2023-12-31', 1),
('playlist2', 14, '2023-04-12', 1),
('playlist3', 4, '2024-02-14', 2),
('playlist4', 43, '2024-02-12', 3);

insert into playlist_contents (playlist_id, addedby_user_id, song_addedon, song_id) values
(1, 1, '2024-04-14', 1),(1, 2, '2024-04-14', 2),(1, 2, '2024-04-14', 3),
(2, 1, '2024-04-14', 36),(2, 1, '2024-04-14', 35),(2, 4, '2024-04-14', 14),
(3, 4, '2024-04-14', 26),(3, 3, '2024-04-14', 25),(3, 4, '2024-04-14', 24);

insert into subscription (start_date, expire_date, payment_method) values
('2023-11-01', '2024-11-01', 'P'),
('2023-11-01', '2024-11-01', 'C'),
('2023-11-01', '2024-11-01', 'P'),
('2023-11-01', '2024-11-01', 'C');

insert into user (email, password, username, birthdate, sex, country, zip_code, subscription_id) values
('user1@example.com', 'asdfasgas', 'user1', '1971-04-14', 'M', 'Spain', '08800', 1),
('user2@example.com', 'werasfw', 'user2', '1972-04-14', 'F', 'Spain', '08800', 2),
('user3@example.com', 'dfzsdfas', 'user3', '2000-04-14', 'M', 'Spain', '08800', 3),
('user4@example.com', 'asdfasgas', 'user4', '1971-04-14', 'M', 'Spain', '08800', 4);

insert into user (email, password, username, birthdate, sex, country, zip_code) values
('user4@example.com', 'asdfasgas', 'user5', '1994-02-14', 'F', 'Spain', '08800'),
('user4@example.com', 'asdfasgas', 'user4', '2001-03-14', 'M', 'Spain', '08800');

insert into user_follows_artist (user_id, artist_id) values
(1, 1), (1, 4), (2, 1), (2, 3), (3, 6), (3, 4);

insert into user_has_favourites_songs (user_user_id, song_id) values
(1, 1), (1, 4), (2, 1), (2, 3), (3, 6), (3, 4);

insert into payments (payment_ref, payment_date, payment_amount, subscription_id, credit_card_id) values
('1234567890', '2023-11-01', 100, 1, 1),
('2345678901', '2023-11-01', 100, 2, null),
('3456789012', '2023-11-01', 100, 3, 2),
('4567890123', '2023-11-01', 100, 4, null);