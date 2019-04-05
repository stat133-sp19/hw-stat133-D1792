Here's the description of the data variables:

- "team_name": the name of the NBA team the player belongs to.
- "game_date": the date of a game.
- "season": the NBA season in year,
- "period": an NBA game is divided in 4 periods of 12 mins each. For example, if period =1, it refers to the first period (the first 12 mins of the game).
- "minutes_remaining": the amount of minutes remained to be played in a given period.
- "seconds_remaining": the amount of seconds remained to be played in a given period.
- "shot_made_flag": a binary variable which indicates whether a shot was made(shot_yes) or missed(shot_no).
- "action_type": the type of move, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer.
- "shot_type": a binary variabele which indicates whether a shot is a 2-point field goal, or a 3-point field goal.
- "shot_distance": the distance to the basket in feet.
- "opponent": the name of the NBA team that the player played against.
- "x": the x-axis of the court coordinates when a shot occured in inches .
- "y": the y-axis of the court coordinates when a shot occured in inches.
- "name": the name of the player.
- "minute": the minute number where a shot occurred. For instance, if a shot took place during period = 1 and minutes_remaining = 8, then this should correspond to a value minute = 4. Likewise, if a shot took place during period = 4 and minutes_remaining = 2 then this should correspond to a value minute = 46.
