FROM mcr.microsoft.com/dotnet/runtime:3.1-focal AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:3.1-focal AS build
WORKDIR /src
COPY ["CICD Demo.csproj", "./"]
RUN dotnet restore "CICD Demo.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "CICD Demo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CICD Demo.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CICD Demo.dll"]
