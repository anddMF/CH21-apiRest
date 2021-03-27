FROM mcr.microsoft.com/dotnet/aspnet:2.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:2.1 AS build
WORKDIR /src
COPY ["Choice21.API.Rest/Choice21.API.Rest.csproj", "Choice21.API.Rest/"]
RUN dotnet restore "Choice21.API.Rest\Choice21.API.Rest.csproj"
COPY . .
WORKDIR "/src/Choice21.API.Rest"
RUN dotnet build "Choice21.API.Rest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Choice21.API.Rest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Choice21.API.Rest.dll"]
