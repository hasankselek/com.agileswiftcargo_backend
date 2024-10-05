# AgileSwiftCargo Backend Testleri için Hazırlanan Proje

Bu proje, AgileSwiftCargo Backend testleri için hazırlanmıştır. Proje, AgileSwiftCargo web sitesi üzerinde çeşitli backend otomasyon senaryolarını içerir ve Cucumber,RestAssured gibi popüler test otomasyon araçları kullanılarak geliştirilmiştir. Bu proje, API ve SQL test otomasyonu testlerini kapsar.

## Kullanılan Teknolojiler

- **Java 17**: Projenin ana programlama dili.
- **Maven**: Proje yönetimi ve bağımlılık yönetimi için kullanıldı.
- **Cucumber**: BDD (Behavior-Driven Development) çerçevesi ile test senaryolarını yazmak için kullanıldı.
- **JUnit 5**: Testlerin yürütülmesi ve raporlanması için kullanıldı.
- **JavaFaker**: Test verilerini dinamik olarak üretmek için kullanıldı.
- **Jenkins**:GitHub entegre edilerek, her kod değişikliği yapıldığında otomatik olarak bir işlem başlatılabildi, böylece hatalar erken aşamada tespit edilip düzeltildi.
- **RestAssured**:API testlerini yapmak için kullanıldı
- **MYSQL**:SQL sorgularını yapmak için kullanıldı.
- **Lombok**:Java’da boilerplate kodları (tekrar eden kodlar) azaltmak için kullanıldı.

## Proje Yapısı

- **`src/test/java/base`**: BaseTest abstract classını barındırır ve kod tekrarını azaltır.
- **`src/test/java/config_Requirements`**: Yardımcı class ve excel dosyalarını kullanabilmemiz için gerekli classları barındırır.
- **`src/test/java/HelperDB`**: Database testleri için yardımcı classları bulundurur.
- **`src/test/java/hooks`**: API testlerinde kullanılan Hooks classını bulundurur.
- **`src/test/java/Manage`**: Database testleri için gerekli SQL sorgularını barındırır.
- **`src/test/java/pojos`**: API testleri için gerekli pojo classları kullanır.
- **`src/test/java/runners`**: API ve DB olmak üzere 2 runner bulundurur.
- **`src/test/java/stepdefinitions`**: API ve DB testlerinin steplerini bulundurur.
- **`src/test/java/utilities`**: API ve DB testleri için yazılmış yardımcı methodları bulundurur.
- **`src/test/resources/config.yaml`**: API ve DB için gerekli olan access bilgilerini bulundurur.
- **`src/test/resources/features`**: API ve DB test senaryolarını barındırır.
- **`src/test/resources/testData`**: API testleri için gerekli olan access bilgilerini excel formatında bulundurur.
- **`pom.xml`**: Projede kullanılan tüm bağımlılıkları yöneten Maven yapılandırma dosyası.

## Raporlama

- **Cucumber-Reports:** Test sonuçları, Cucumber tarafından oluşturulan HTML raporları ile ayriyeten "Cucumber Reports" ile daha ayrıntılı olarak incelenebilir.
         
- Bu raporlar, testlerin detaylı bir şekilde incelenmesini sağlar ve `Cucumber-HTML-Reports` dizininde HTML,JSON,XML formatında saklanır.

## Kurulum ve Çalıştırma

1. **Bağımlılıkları Yükleme**:
    - Maven aracılığıyla projenin bağımlılıklarını indirmek için `mvn clean install` komutunu çalıştırın.

2. **Testleri Çalıştırma**:
    - `src/test/java` altındaki test senaryolarını çalıştırmak için `mvn test` komutunu kullanın.

3. **Konfigürasyon**:
    - `config.yaml` dosyası, test ortamı ayarlarını ve diğer yapılandırma parametrelerini içerir.
    - URL, API ve Database access bilgilerini içerir.

## Kullanım Senaryoları

- **API Test Senaryoları**: Blog, deliveryman, hub, merchant, merchatshop, packaging, parcel, pickuprequest, support sayfalarının API sorguları yapılmıştır.
- **DB Test Senaryoları**: Toplam 30 adet SQL sorgusu yapılarak gerekli doğrulamalar yapıldı.

## Notlar

- Bu proje, AgileSwiftCargo Backend testleri için hazırlanmıştır.

- Test senaryoları, AgileSwiftCargo API ve Database fonksiyonlarını kontrol etmek için tasarlanmıştır.

- Proje, backend test otomasyonunu kapsayacak şekilde yapılandırılmıştır.








