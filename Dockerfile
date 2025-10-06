FROM tomcat:9.0-jdk21-temurin

LABEL maintainer="yourname@example.com"

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Add Postgres JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.7.4.jar /usr/local/tomcat/lib/

# Copy WAR
COPY factotime.war /usr/local/tomcat/webapps/ROOT.war

# Environment variables for Supabase (set in Render dashboard)
ENV DB_URL="jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:5432/postgres"
ENV DB_USER="postgres.rdutjyuqvnzkgjodamue"
ENV DB_PASSWORD="5DsbSqyMbDgA3Ibw"

EXPOSE 8080

CMD ["catalina.sh", "run"]