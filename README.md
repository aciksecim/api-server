# Açık Seçim
Projeyi çalıştırmadan önce AcikSecim/AcikSecim.WebApi/Models/WebApiDbContext.cs sınıfı içerisinde yer alan database konfigurasyonunu kendi userID ve password değerleriniz ile değiştirin

Sonrasında Nuget Package Manager Console içerisinde "update database" komutunu çalıştırmanız yeterlidir.


AcikSecim.WebApi klasörünün içerisinden 

 	docker build -t aspnetapp .
 
 komutuyla "aspnetapp" docker image oluşacaktır. Yine aynı şekilde
 
 	docker run -d -p 80:80 aspnetapp:latest

 komutuyla konteyner daemonize olarak çalışacaktır. 
