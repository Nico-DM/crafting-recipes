FROM golang:1.26-bookworm AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

ARG GIT_SHA=unknown
ARG BUILD_TIME=unknown

RUN CGO_ENABLED=0 go build \
	-ldflags "-X github.com/Nico-DM/crafting-recipes/internal/build.GitSHA=${GIT_SHA} -X github.com/Nico-DM/crafting-recipes/internal/build.BuildTime=${BUILD_TIME}" \
	-o /crafting-recipes .

FROM gcr.io/distroless/static-debian12

COPY --from=builder /crafting-recipes /crafting-recipes

EXPOSE 8899

ENTRYPOINT ["/crafting-recipes"]
