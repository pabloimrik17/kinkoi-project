# TODO UPDATE DOCS WHEN UPDATE PNPM
# https://pnpm.io/es/8.x/docker

# Stage 1 - base
FROM node:20.12.2-slim AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

# Stage 2 - the build process
FROM base AS build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm exec nx run-many -t api:build
RUN pnpm deploy --filter=api --prod /prod/api
#RUN pnpm deploy --filter=app2 --prod /prod/app2


# API APP
FROM node:20.12.2-alpine
FROM base AS api
COPY --from=build /prod/api ./prod/api
WORKDIR /prod/api
EXPOSE 8000
CMD [ "pnpm", "run", "start:prod"]
