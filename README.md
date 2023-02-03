# Proximity Learning Test Project

## Contents

- [Assumptions](#assumptions)
- [Dependencies](#dependencies)
- [Project Setup](#project-setup)

## Assumptions

- Make sure that no data exists in the PersonalData table.

## Dependencies

- Bundler v2.3.26
- Ruby 3.1.3
- Ruby on Rails 7.0.4
- MySQL 5.7+

## Project Setup

1. Clone this git repository:

```bash
git clone repo
cd project
```

2. Install the required gems by running the following command in the project root directory:

```bash
bundle install
```

3. Create an `environment_variables.yml` file by copying the example database configuration:

```bash
touch config/environment_variables.yml
```

4. Add your database configuration details to `environment_variables.yml`. You will probably only need to fill in the password for the database(s).
   Example config: development:

```bash
DATABASE_NAME: “”
DATABASE_USERNAME: “”
DATABASE_PASSWORD: “”
```

5. Create and populate database with seeds using (MySql must be set up first. ):

```
rails db:create db:migrate db:seed
```

6. Run server: `rails server` or `rails s`
