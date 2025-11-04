-- 1️.Display all match details
SELECT * FROM t20wc;


  
-- 2️.List all unique venues
SELECT DISTINCT Venue 
FROM t20wc;


  
-- 3️.Count total number of matches
SELECT COUNT(*) AS total_matches 
FROM t20wc;


  
-- 4️.Find total matches won by each team
SELECT Winners, COUNT(*) AS total_wins
FROM t20wc
GROUP BY Winners
ORDER BY total_wins DESC;


  
-- 5️.Find matches where toss winner also won the match
SELECT 
  `Match No.`, 
  `Toss Winning`, 
  Winners FROM t20wc
WHERE `Toss Winning` = Winners;



  
-- 6️.List top 5 highest first innings scores
SELECT `Match No.`, `1st Team`, `First Innings Score`
FROM t20wc
ORDER BY `First Innings Score` DESC
LIMIT 5;


  
-- 7️.Count matches by stage (Group, Semi, Final)
SELECT Stage, COUNT(*) AS total_matches
FROM t20wc
GROUP BY Stage;


  
-- 8️.Find average winning margin
SELECT ROUND(AVG(`Winning Margin`), 4) AS avg_winning_margin
FROM t20wc
WHERE `Winning Margin` != 'Rain';


  
-- 9️.List all matches with “Player of the Match”
SELECT `Match No.`, `Player Of The Match`, Winners
FROM t20wc;


  
-- 10. Show top scorers and their highest scores
SELECT `Top Scorer`, MAX(`Highest Score`) AS highest_score
FROM t20wc
GROUP BY `Top Scorer`
ORDER BY highest_score DESC;


-- 1️1.Find the 2 teams with the most "Player of the Match" awards
SELECT winners, count(`Player Of The Match`) AS   total_Awards
FROM t20wc
GROUP BY winners
ORDER BY total_Awards DESC
LIMIT 2;



-- 12️.Compare matches won by batting first vs fielding first
SELECT `Toss Decision`, COUNT(*) AS Matches_Won
FROM t20wc
GROUP BY `Toss Decision`;



-- 13.find the venue with the highest average first innings score
SELECT `Venue`, ROUND(AVG(`First Innings Score`), 2) AS Avg_First_Innings
FROM t20wc
GROUP BY `Venue`
ORDER BY Avg_First_Innings DESC
LIMIT 1;



-- 14️.Find all matches won by teams batting in 2nd innings
SELECT `Match No.`, `1st Team`, `2nd Team`, `Winners`, `Toss Decision`, `Won by`
FROM t20wc
WHERE `Toss Decision` = 'Fielding' AND `Winners` is not null;



-- 15.Identify top 5 matches with the largest winning margin
SELECT `Match No.`, `1st Team`, `2nd Team`, `Winners`, `Winning Margin`
FROM t20wc
WHERE `Winning Margin` != 'Rain'
ORDER BY CAST(`Winning Margin` AS UNSIGNED) DESC
LIMIT 5;



-- 16.Find the most frequent "Player of the Match"
SELECT `Player Of The Match`, COUNT(*) AS Total_Wins
FROM t20wc
GROUP BY `Player Of The Match`
ORDER BY Total_Wins DESC
LIMIT 1;



-- 17️.Calculate total matches played by each team
SELECT Team, COUNT(*) AS Matches_Played
FROM (
    SELECT `1st Team` AS Team FROM t20wc
    UNION ALL
    SELECT `2nd Team` AS Team FROM t20wc
) AS all_teams
GROUP BY Team
ORDER BY Matches_Played DESC;



-- 18️.Show average winning margin by stage (Group, Semi, Final)
SELECT `Stage`, ROUND(AVG(CAST(`Winning Margin` AS UNSIGNED)), 2) AS Avg_Winning_Margin
FROM t20wc
WHERE `Winning Margin` != 'Rain'
GROUP BY `Stage`
ORDER BY Avg_Winning_Margin DESC;



-- 19.Find top scorers who appeared more than once
SELECT `Top Scorer`, COUNT(*) AS Matches_Played, MAX(`Highest Score`) AS Top_Score
FROM t20wc
GROUP BY `Top Scorer`
HAVING COUNT(*) > 1
ORDER BY Matches_Played DESC;



-- 20. Find correlation between toss winners and match winners (percentage)
SELECT 
  ROUND(
    (SUM(CASE WHEN `Toss Winning` = `Winners` THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
  ) AS Toss_Win_Correlation_Percentage
FROM t20wc;


