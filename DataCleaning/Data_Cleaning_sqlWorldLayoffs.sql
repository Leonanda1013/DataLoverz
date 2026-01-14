-- DATA CLEANING

SELECT * FROM layoffs;

-- Change column name

-- ALTER TABLE layoffs
-- RENAME COLUMN `COL 1` TO company;
-- SELECT * FROM layoffs;

-- ALTER TABLE layoffs
-- RENAME COLUMN `COL 2` TO location;
-- SELECT * FROM layoffs;

-- ALTER TABLE layoffs
-- RENAME COLUMN `COL 3` TO industry,
-- RENAME COLUMN `COL 4` TO total_laid_off;

ALTER TABLE layoffs
RENAME COLUMN `COL 5` TO percentage_laid_off,
RENAME COLUMN `COL 6` TO layoff_date,
RENAME COLUMN `COL 7` TO stage,
RENAME COLUMN `COL 8` TO country,
RENAME COLUMN `COL 9` TO funds_raised_millions;
SELECT * FROM `layoffs`;

DELETE FROM layoffs lay
WHERE lay.company = 'company';

SELECT * FROM layoffs;

-- -----------------------------------------------------
-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove any column
-- -----------------------------------------------------

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;

-- SELECT *, 
-- ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off, layoff_date) AS row_num
-- FROM layoffs_staging;

-- ----------------------------------------
-- 1. Remove Duplicates
-- ----------------------------------------
WITH duplicate_CTE AS
(
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, layoff_date, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * FROM duplicate_CTE
WHERE row_num > 1;
;

SELECT * FROM layoffs_staging WHERE company = 'Cazoo';


-- CREATE TABLE layoffs_staging2 LIKE layoffs_staging;

SELECT * FROM layoffs_staging2;
-- ALTER TABLE layoffs_staging2
-- ADD COLUMN row_num INT;

INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, layoff_date, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2;

SELECT * FROM layoffs_staging2 WHERE company = 'Cazoo';

DELETE FROM layoffs_staging2 WHERE row_num > 1;

SELECT * FROM layoffs_staging2 WHERE company = 'Cazoo';

SELECT * FROM layoffs_staging2 WHERE row_num > 1;


-- ----------------------------------------
-- 2. Standardize the data
-- ----------------------------------------

-- TRIM
SELECT * FROM `layoffs_staging2`;

SELECT company, TRIM(company) FROM `layoffs_staging2`;

UPDATE layoffs_staging2 
SET company = TRIM(company);

-- Change with Distinct
SELECT DISTINCT industry FROM layoffs_staging2 ORDER BY 1;

SELECT * FROM `layoffs_staging2`WHERE industry LIKE 'Crypto%';
UPDATE `layoffs_staging2`
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT * FROM `layoffs_staging2`WHERE industry LIKE 'Crypto%';
SELECT DISTINCT industry FROM layoffs_staging2 ORDER BY 1;


-- TRIM(TRAILING ' ' FROM column_name)
SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) FROM layoffs_staging2 ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE country;

SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;

-- String to Date
SELECT layoff_date FROM `layoffs_staging2`; 

SELECT layoff_date, STR_TO_DATE(layoff_date, '%m/%d/%Y') AS converted_date
FROM layoffs_staging2;

SELECT 
    layoff_date,
    STR_TO_DATE(layoff_date, '%m/%d/%Y') AS converted_date
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET layoff_date = STR_TO_DATE(layoff_date, '%m/%d/%Y')
WHERE layoff_date != '';

UPDATE layoffs_staging2
SET layoff_date = NULL
WHERE layoff_date = '';

ALTER TABLE layoffs_staging2
MODIFY COLUMN layoff_date DATE;



-- ----------------------------------------
-- 3. Null values or blank values
-- ----------------------------------------
SELECT * FROM `layoffs_staging2`;

SELECT * FROM layoffs_staging2
WHERE industry IS NULL or industry = '';

SELECT * FROM layoffs_staging2
WHERE company = 'Airbnb';

SELECT t1.industry, t2.industry FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE (t1.industry IS NUll OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT t1.industry, t2.industry FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE (t1.industry IS NUll OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NUll
AND t2.industry IS NOT NULL;

SELECT t1.industry, t2.industry FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE (t1.industry IS NUll OR t1.industry = '')
AND t2.industry IS NOT NULL;


SELECT * FROM layoffs_staging2
WHERE company = 'Airbnb';



-- ----------------------------------------
-- 4. Remove any column
-- ----------------------------------------
SELECT * FROM layoffs_staging2 WHERE total_laid_off = "";

SELECT * FROM layoffs_staging2 WHERE total_laid_off = "" AND percentage_laid_off = "";

SELECT * FROM layoffs_staging2;

DELETE FROM layoffs_staging2 WHERE total_laid_off = "" AND percentage_laid_off = "";
ALTER TABLE layoffs_staging2
DROP COLUMN `row_num`;

SELECT * FROM layoffs_staging2;

-- SELESAI


