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


Extract
The zipped dataset is directly extracted from the Maven Sales website, performed minor transformation and loaded into PostgeSQL instance spinned up in CloudSQL Google Cloud's fully managed relational database service

Transform
After the dataset is loaded data is tranformed to marts via dbt 

Visulization
Using Power BI data is visualized to answer the questions above
