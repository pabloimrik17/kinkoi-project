# TODO UPDATE DOCS WHEN UPDATE PNPM
# https://pnpm.io/es/8.x/docker

# Stage 1 - base
FROM node:20.12.2-slim@sha256:72f2f046a5f8468db28730b990b37de63ce93fd1a72a40f531d6aa82afdf0d46 AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

# Stage 2 - the build process
FROM base AS build

# TODO Review this so we can take from cache the step and skip dependencies install
COPY . /usr/src/app
WORKDIR /usr/src/app

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile

COPY . .

# TODO IN FUTURE THIS WILL BE JUST run-many -t build
RUN pnpm exec nx run-many -t build -p api -p @kinkoi/dashboard

RUN pnpm deploy --filter=api --prod /prod/api
RUN pnpm deploy --filter=@kinkoi/dashboard --prod /prod/kinkoi-dashboard

# ASTRO APP
FROM base AS kinkoi-dashboard
COPY --from=build /prod/kinkoi-dashboard /prod/kinkoi-dashboard
WORKDIR /prod/kinkoi-dashboard

ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

CMD ["node",  "dist/server/entry.mjs"]


# API APP
FROM base AS api
COPY --from=build /prod/api /prod/api
WORKDIR /prod/api

CMD [ "pnpm", "run", "start:prod"]
