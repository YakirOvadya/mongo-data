# mongo-data

This repository contains seed data and CI/CD pipelines for building and distributing a MongoDB Docker image preloaded with data.

## Purpose

The goal of this repository is to:

- Provide a preloaded MongoDB container image for development environments
- Automatically build and publish a new image whenever the seed data changes (main commit)
- Propagate the new image tag to a configuration repository (`app-config`) for consumption by other services

## Seed Data Format

- The file `users.json` contains a JSON array of user documents
- The data is formatted to be importable with `mongoimport --jsonArray`

## Required Environment Variables (GitHub Secrets)

| Name               | Description                                                                         |
| ------------------ | ----------------------------------------------------------------------------------- |
| `APP_CONFIG_TOKEN` | A fine-grained GitHub PAT (Personal Access Token) with write access to `app-config` |
| `REPOSITORY_OWNER` | Using for GitHub Container Registry location with lowercase letters                 |
| `GHCR_TOKEN`       | Automatically provided by GitHub (`secrets.GITHUB_TOKEN`)                           |

## Pipeline Stages (GitHub Actions)

1. **Checkout repository**
2. **Set up Docker Buildx**
3. **Log in to GHCR**
4. **Build and push Docker image** tagged with the commit SHA
5. **Clone **\`app-config\`** repository**
6. **Update **\`mongodb-version.txt\`** with new SHA**
7. **Push update to **\`main\`** branch of ** \`app-config\`

## Manual Execution Instructions (Local)

1. Clone the latest :

   ```bash
   git clone https://github.com/YakirOvadya/honeycombhwrun.git
   ```

2. Use the provided scripts:

   - Windows: `get-tag.bat`
   - Linux/macOS: `get-tag.sh`

   - Server Running on localhost:3000

3. Modify the seed data:
   - Edit the \`users.json\` file located in the \`mongo-data\` directory
   - Ensure the file remains in valid JSON array format, like this:
   ```bash
   [
   { "name": "Alice", "email": "alice@example.com" },
   { "name": "Bob", "email": "bob@example.com" }
   ]
   ```

## Deliverables

- **Repositories:**

  - [`mongo-data`](https://github.com/yakirovadya/mongo-data)
  - [`app-config`](https://github.com/yakirovadya/app-config)

- **Latest Successful Pipeline:**

  - [GitHub Actions - mongo-data](https://github.com/yakirovadya/mongo-data/actions/runs/15187662049)

- **Public Image URL (GHCR):**

  - `ghcr.io/yakirovadya/mongo-seed:0acd9a09f4cf20fd1087f436587fe2d7e915cef2`

## Visual Output

Below is an example of the running system, where the users are fetched from MongoDB and the SHA tag is displayed via the Express consumer service:
