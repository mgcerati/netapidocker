#Get base SDK Image frim Microsoft 
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

# COPY the CSPROJ file and restore any dependencies (via NUGET)
COPY *.csproj ./
RUN dotnet restore

#Copy the project files and build out release
COPY  . ./
RUN dotnet publish -c Release -o out

#Generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
EXPOSE 88
COPY --from=build-env /app/out .
ENTRYPOINT [ "dotnet", "DockerAPI.dll" ]