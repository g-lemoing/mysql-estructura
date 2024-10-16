use youtube;

INSERT INTO `youtube`.`user`
(`email`,`password`,`username`,`birthdate`,`sex`,`country`,`zipcode`)
VALUES
('user1@example.com', 'a1b2c3d4', 'user1', '2000-10-16', 'F', 'Espanya', '08000'),
('user2@example.com', 'a3b4c5d6', 'user2', '1995-10-16', 'F', 'France', '08000'),
('user3@example.com', 'sfaselu', 'user3', '1980-12-16', 'M', 'United Kingdom', 'LW19DJ'),
('user4@example.com', 'ereefasf', 'user4', '1973-02-16', 'M', 'Espanya', '28000'),
('user5@example.com', 'e03ld03k', 'user5', '2004-05-16', 'F', 'Espanya', '18000');

INSERT INTO tag ( name) VALUES
('documental'), ('drama'), ('comedia'), ('autoayuda'), ('suspense');

INSERT INTO video
(`title`,`description`,`size`,`filename`,`duration`,`thumbnail`,`state`,
 `publishedby_user_id`, `publishedon`)
VALUES
('Cèrvols al pirineu', 'Cèrvols al pirineu', 500, 'path/cervol.mp4', '00:47:02', 'path/cervol.jpg', 'Public', 1, '2020-10-03 16:56:56'),
('Empatizar', 'Empatizar con los demás', 700, 'path/empatizar.mp4', '00:17:02', 'path/empatizar.jpg', 'Public', 2, '2022-10-03 16:56:56'),
('Cuina ràpida', 'Cuina ràpida', 400, 'path/cuina.mp4', '00:27:02', 'path/cuina.jpg', 'Privat', 3, '2020-06-03 16:56:56'),
('Gags casolans', 'Gags casolans', 800, 'path/gags.mp4', '00:37:02', 'path/gags.jpg', 'Privat', 1, '2024-08-03 16:56:56'),
('Mort del gos', 'Mort del gos', 500, 'path/mortgos.mp4', '00:07:02', 'path/mortgos.jpg', 'Public', 2, '2023-10-03 16:56:56'),
('Deixa de fumar', 'Deixa de fumar', 500, 'path/deixar_fumar.mp4', '00:34:02', 'path/deixar_fumar.jpg', 'Public', 3, '2020-04-03 16:56:56'),
('Cèrvols al pirineu', 'Cèrvols al pirineu', 500, 'path/cervol.mp4', '00:09:02', 'path/cervol.jpg', 'Public', 1, '2020-10-03 16:56:56');

INSERT INTO channel (name, createdon, description, createdby_user_id) VALUES
('mi canal', '2023-09-22', 'mis cosas', 1),
('mi otro canal', '2024-09-22', 'más de mis cosas', 1),
('natura', '2024-09-22', 'la natura i jo', 2);

INSERT INTO playlist(name, createdon, state, user_id) VALUES
('playlist1', '2024-06-24', 'Public', 1),
('playlist2', '2024-07-24', 'Privat', 1),
('playlist3', '2024-06-24', 'Privat',2);

insert into playlist_has_videos (video_id, playlist_id) values
(1, 4), (2, 4), (4, 4),
(3, 5), (2, 5), (6, 5);

INSERT INTO review (contents, createdon, video_id, user_id) values
('Video boníssim', '2024-10-01 16:09:00', 1, 2),
('Video recomanable', '2024-10-11 16:09:00', 1, 3),
('Video boníssim', '2024-10-08 16:20:00', 2, 4),
('Video recomanable', '2024-10-04 16:09:10', 3, 4);

INSERT INTO user_rates_videos (rating, video_id, user_id, createdon) VALUES
('Like', 1, 1, '2024-10-11 23:09:08'),
('Dislike', 1, 2, '2024-10-12 23:09:08'),
('Like', 3, 1, '2024-09-11 13:09:08'),
('Dislike', 3, 2, '2024-10-11 13:19:08'),
('Like', 2, 1, '2024-08-11 03:09:08');

INSERT INTO user_review_rating (rating, createdon, user_id, review_id) VALUES
('Like', '2024-10-11 23:09:08', 1, 1),
('Dislike', '2024-10-12 23:09:08', 1, 2),
('Like', '2024-09-11 13:09:08', 3, 3),
('Dislike', '2024-10-11 13:19:08', 3, 2),
('Like', '2024-08-11 03:09:08', 2, 4);

INSERT INTO user_subscribes_channel (channel_id, user_id) VALUES
(1, 1), (2, 1), (1, 4), (3, 4), (1, 3);

INSERT INTO video_has_tags (video_id, tag_id) VALUES
(1, 1), (1, 2), (2, 5), (3, 2), (3, 5);