# 🔍 Business Challenge
MavenTech, a B2B computer hardware company, lacked actionable insights into sales performance beyond CRM data. Sales managers faced challenges in tracking team progress, identifying underperformers, and making data-driven decisions, hindering their ability to meet quarterly sales targets.

# 🎯 Objectives
Build an interactive dashboard for sales managers to:
  - Monitor sales agents’ performance and identify underperformers
  - Track team performance and compare results across teams
  - Identify areas of focus to improve key performance indicators

# ⚙️ Solution Approach
Initial Planning
First to consider in creating the project is what kind of audience will be using the dashsboard, given sales manager will use the dashboard, first consideration is to make the dashboard simplier and sales managers can find insights at a glance

STEP 1: Create a Virutal Machine Instance 
1. Installing Docker and dependecies
2. Data Ingestion with Kestra

STEP 2: Create an SQL database by spinning up PostgreSQL instance via CloudSQL

STEP 3: Connect Local Machine to database with running cloud-sql-proxy 

STEP 4: Do Transformation of database with dbt
1. Create a python virtual environment and install dbt core and database adapter
2. Initialize dbt
3. 

