# Açık Seçim
Projeyi çalıştırmadan önce AcikSecim/AcikSecim.WebApi/Models/WebApiDbContext.cs sınıfı içerisinde yer alan database konfigurasyonunu kendi userID ve password değerleriniz ile değiştirin

Sonrasında Nuget Package Manager Console içerisinde "update database" komutunu çalıştırmanız yeterlidir

Postgresql kuralım öncelikle, terminalimize aşağıdaki komutu yazıyoruz;
		
		docker run --name postg -e POSTGRES_PASSWORD=123456 -d postgres 

Sonrasında ise oluşan postgresql containerimizin yerel ip adresi ile api-client içerisindeki ip adresi ile aynı mı diye aşağıdaki komut ile kontrol ediyoruz;

		docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postg
 
Eğer sonuç 172.17.0.2 ise direkt olarak client build alma kısmına geçebilirsiniz.

Sonuç 172.17.0.2 değilse;  AcikSecim.WebApi/Models/WebApiDbContext.cs içerisindeki

		"User ID=postgres; Password=123456; Server=172.17.0.2; Port=5432; Database=AcikSecimDB; Integrated Security=true;");

Server = 172.17.0.2 olan IP adresini docker inspect komutundan aldığımız cevapla değiştiriyoruz. Artık build almaya hazırız.

AcikSecim.WebApi klasörünün içerisinden 

 	docker build -t aspnetapp .
 
 komutuyla "aspnetapp" docker image oluşacaktır. Yine aynı şekilde
 
 	docker run --name aspapi -d -p 80:80 aspnetapp:latest

 komutuyla konteyner daemonize olarak çalışacaktır. 

 # Varolan konteynerı güncellemek
 
 Kaynak kodları üzerinde düzenleme yaptıysanız ve **değişiklikler github reposuna yansıdıysa** aşağıdaki kodla oluşturduğunuz konteyneri silip üstteki adımları takip etmeniz yeterlidir.
 
 	docker container rm aspapi
	
**Kaynak kodundaki değişikliker henüz sadece yerelde değiştiyse**

Üsttekinden tek farklı olarak clone yapmadan build almanızdır, şu şekilde;

 	docker container rm aspapi

ile konteynerimizi siliyoruz ve AcikSecim.WebApi klasörünün içerisine girip

 	docker build -t aspnetapp .

yeni imaj oluşturuyoruz. 

 	docker run --name aspapi -d -p 80:80 aspnetapp:latest

yazarak konteynerimizin güncel halini görebiliriz.

# Konteyner loglarını görüntülemek

	docker container logs postg

komutu ile postgresql konteynerının logları,

	docker container logs aspapi

komutu ile asp.net api konteynerimizin loglarını görüntüleyebiliriz.
