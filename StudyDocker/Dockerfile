FROM microsoft/dotnet:2.0-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.0-sdk AS build
WORKDIR /src
COPY StudyDocker/StudyDocker.csproj StudyDocker/
RUN dotnet restore StudyDocker/StudyDocker.csproj
COPY . .
WORKDIR /src/StudyDocker
RUN dotnet build StudyDocker.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish StudyDocker.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "StudyDocker.dll"]
