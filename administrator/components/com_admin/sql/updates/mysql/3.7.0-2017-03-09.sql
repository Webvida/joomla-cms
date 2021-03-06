UPDATE `#__categories` AS `c` INNER JOIN (
	SELECT c2.id, CASE WHEN MIN(p.published) > 0 THEN MAX(p.published) ELSE MIN(p.published) END AS newPublished
	FROM `#__categories` AS `c2`
	INNER JOIN `#__categories` AS `p` ON p.lft <= c2.lft AND c2.rgt <= p.rgt
	GROUP BY c2.id) c2
ON c.id = c2.id
SET published = c2.newPublished;

UPDATE `#__menu` AS `c` INNER JOIN (
	SELECT c2.id, CASE WHEN MIN(p.published) > 0 THEN MAX(p.published) ELSE MIN(p.published) END AS newPublished
	FROM `#__menu` AS `c2`
	INNER JOIN `#__menu` AS `p` ON p.lft <= c2.lft AND c2.rgt <= p.rgt
	GROUP BY c2.id) c2
ON c.id = c2.id
SET published = c2.newPublished;
