FROM microsoft/dotnet:2.0-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.0-sdk AS build
WORKDIR /src
RUN dotnet restore StudyDocker.csproj
COPY . .
WORKDIR /src
RUN dotnet build StudyDocker.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish StudyDocker.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "StudyDocker.dll"]
