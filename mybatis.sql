		select users.user_id, user_name, reg_date, post_title, post_content
		from users join posts
		on users.user_id = posts.user_id
		where users.user_name = 'john';