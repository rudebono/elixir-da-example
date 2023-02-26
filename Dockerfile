FROM hexpm/elixir:1.14.2-erlang-25.2.3-ubuntu-jammy-20221130 as builder
ARG _MIX_ENV
ARG _RELEASE_NAME
WORKDIR /src
COPY . .
# Setup SSH
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get
RUN MIX_ENV=${_MIX_ENV} mix release.setup
RUN MIX_ENV=${_MIX_ENV} mix release ${_RELEASE_NAME}
RUN mv _build/${_MIX_ENV}/rel/${_RELEASE_NAME} /opt/release
RUN mv /opt/release/bin/${_RELEASE_NAME} /opt/release/bin/app

FROM hexpm/elixir:1.14.2-erlang-25.2.3-ubuntu-jammy-20221130 as runner
WORKDIR /opt/release
COPY --from=builder /opt/release .
CMD /opt/release/bin/app start
