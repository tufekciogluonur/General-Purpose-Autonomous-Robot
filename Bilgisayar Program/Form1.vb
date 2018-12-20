Public Class Form1
    'Değişkenler tanımlanır
    Public Uzaklik, Yon, RobotYon, x, y, t, r As Integer
    Public Harita(40, 40), Yol(40, 40) As Integer
    Public TumHareket(10000) As Integer
    Public Rota(1000) As Integer
    Public Path(40, 40) As Integer



    'Uzaklık değişkeni robottan alınan mesafe bilgisini tutar.
    'x değişkeni robotun bulundugu konumun x eksenindeki değerini tutar.Başlangıç değeri 11 dir.
    'y değişkeni robotun bulundugu konumun y eksenindeki değerini tutar.Başlangıç değeri 11 dir.
    'RobotYon değişkeni robot'un yönünü tutar. Yukarı(1), Sağ(2),Aşağı(3),Sol(4) ile temsil edilir.Başlangiç değeri 1 dir.
    'Yon değişkeni gitmek istediğimiz yön bilgisini tutar.Yukarı(1), Sağ(2),Aşağı(3),Sol(4) ile temsil edilir.
    'Harita değişkeni 40*40 lık bir matris üzerinde harita da ölçülen değerlerin işaretlenmesini sağlar.10<x<31 ve 10<y<31
    'aralığındaki değerler bizim ölçüm yapmak istediğimiz değerlerdir.Diğer alanlar ölçüm ve işlem kolaylığı icin
    'tanımlanmıştır.Başlangıçta tüm değerleri "2" ile işaretlidir. "2" ölçüm yapılmamıs manasına gelir."1" ile işaretli 
    'yerler Engel Yok manasına gelir."0" ile işaretli yerler Engel Var manasına gelir.
    'Yol değişkeni Robot'un hareket edebileceği alanı gösterir. x<11 ve x>30 ile y<11 ve y>30 aralığı robotun hareket 
    'edebileceği alan dısıdır ve "5" ile işaretlidir.Kalan yerler başlangıçta "2" ile işaretlidir ve "2" ölçüm yapılmamış
    'manasına gelir."1" engel yok manasına gelir."0"engel var manasına gelir.
    't degiskeni TumHareket dizisindeki hareket edilen noktaların bilgisini tutmak icin kullanılır. Baslangıc degeri 1'dir
    '2 ser artar x ve y degerlerini sırasıyla tutar.
    'r degiskeni Rota dizisindeki hareket edilen noktaların bilgisini tutumak icin kullanılır.Baslangıc degeri 1'dir.
    '2 ser artar x ve y degerlerini sırasıyla tutar.
    'TumHareket dizisi hareket edilen tüm noktaların bilgisini tutar.Harita tarama hareketleri dahil.
    'Rota dizisi Robot'un yaptıgı hareket bilgisini tutar.İlerle() fonksiyonu çağırıldıktan sonra robotun yaptığı 
    'hareketlerin bilgisini tutar.
    'Path değişkeni Robot'un hareket edebileceği alanı gösterir. x<11 ve x>30 ile y<11 ve y>30 aralığı robotun hareket 
    'edebileceği alan dısıdır ve "5" ile işaretlidir.Kalan yerler başlangıçta "2" ile işaretlidir ve "2" hareket edilmemis
    'manasına gelir.Hareket edilen yerler "3" ile isaretlenir.

    '-----------------------------------------
    'Fonksiyon ve Procedure'ler tanımlanır
    '-----------------------------------------
    'MesafeOlc Fonksiyonu
    Function MesafeOlc() As Integer
        SerialPort1.Open()             'Seri portu açtım.
        Uzaklik = SerialPort1.ReadChar 'Mesafe Bilgisini uzaklik değişkenine atadım.
        SerialPort1.Close()            'Seri portu kapadım.
    End Function
    'Hareket Fonksiyonları
    'IleriGit prosedür'ü 
    Sub IleriGit()
        SerialPort1.Open()             'Seri portu açtım
        SerialPort1.Write("1")         'Seri porta 1 değerini gönderdim
        SerialPort1.Close()            'Seri portu kapattım.
    End Sub
    'GeriGit prosedür'ü
    Sub GeriGit()
        SerialPort1.Open()             'Seri portu açtım.
        SerialPort1.Write("2")         'Seri porta 2 değerini gönderdim.
        SerialPort1.Close()            'Seri portu kapattım.
    End Sub
    'Sağ'a dön prosedür'ü
    Sub SagDon()
        SerialPort1.Open()             'Seri portu açtım.
        SerialPort1.Write("8")         'Seri porta 8 değerini gönderdim.
        SerialPort1.Close()            'Seri portu kapattım.
    End Sub
    'Sol'a dön prosedür'ü
    Sub SolDon()
        SerialPort1.Open()             'Seri portu açtım.
        SerialPort1.Write("7")         'Seri porta 7 değerini gönderdim.
        SerialPort1.Close()            'Seri portu kapattım.
    End Sub
    'Hareket prosedür'ü
    'Yol(x,y)= 2 (ölçüm yok), 1 (Engel Yok), 0 (Engel var), 5 (Hareket Alanı Dışı)
    Sub Hareket(ByVal a As Integer, ByRef b As Integer, ByVal k As Integer)
        Dim Hareket_a, Hareket_b, Hareket_k As Integer
        Hareket_a = a
        Hareket_b = b
        Hareket_k = k
        If Yol(Hareket_a, Hareket_b) < 5 Then   'Hareket alanı dısında mı kontrolu yapıyorum.      
            Yol(Hareket_a, Hareket_b) = Hareket_k      'Yol matrisine ölçülen değeri aktarır.
        End If
    End Sub
    'KonumAyarla prosedür'ü
    'Robot'un mevcut pozisyon bilgisinden istenilen yön bilgisine doğru hareketini sağlar.
    'Dışardan ayarlanacak yön bilgisini alır.
    Sub KonumAyarla(ByVal yon As Integer)
        Dim KonumYon As Integer
        KonumYon = yon
        If RobotYon = 1 Then 'Robotun Yönü "1" ise nasıl hareket edeğini tanımlar.
            If KonumYon = 2 Then
                SagDon()
            End If
            If KonumYon = 3 Then
                SagDon()
                SagDon()
            End If
            If KonumYon = 4 Then
                SolDon()
            End If
        End If
        If RobotYon = 2 Then 'Robotun Yönü "2" ise nasıl hareket edeğini tanımlar.
            If KonumYon = 1 Then
                SolDon()
            End If
            If KonumYon = 3 Then
                SagDon()
            End If
            If KonumYon = 4 Then
                SagDon()
                SagDon()
            End If
        End If
        If RobotYon = 3 Then 'Robotun Yönü "3" ise nasıl hareket edeğini tanımlar.
            If KonumYon = 1 Then
                SagDon()
                SagDon()
            End If
            If KonumYon = 2 Then
                SolDon()
            End If
            If KonumYon = 4 Then
                SagDon()
            End If
        End If
        If RobotYon = 4 Then
            If KonumYon = 1 Then
                SagDon()
            End If
            If KonumYon = 2 Then
                SagDon()
                SagDon()
            End If
            If KonumYon = 3 Then 'Robotun Yönü "3" ise nasıl hareket edeğini tanımlar.
                SolDon()
            End If
        End If
    End Sub
    'HaritaIsaretle prosedür'ü
    'Bu fonksiyon mesafe'yi ölçer ve robot'un bulundugu yöne göre Harita metrisi ve Yol matrisi üzerinde işaretleme yapar.
    Sub HaritaIsaretle(ByVal yon As Integer)
        Dim OlcumYonu, Isaret, i, j, k, a, b, MatrisUygun, MatrisEngel As Integer
        OlcumYonu = yon
        Isaret = 0
        i = x
        j = y
        k = 0
        a = 0
        b = 0
        MesafeOlc()
        If (Uzaklik >= 120) Then
            MatrisUygun = 6
            MatrisEngel = 0
        End If
        If (100 <= Uzaklik) And (Uzaklik < 120) Then
            MatrisUygun = 5
            MatrisEngel = 6
        End If
        If (80 <= Uzaklik) And (Uzaklik < 100) Then
            MatrisUygun = 4
            MatrisEngel = 5
        End If
        If (60 <= Uzaklik) And (Uzaklik < 80) Then
            MatrisUygun = 3
            MatrisEngel = 4
        End If
        If (40 <= Uzaklik) And (Uzaklik < 60) Then
            MatrisUygun = 2
            MatrisEngel = 3
        End If
        If (20 <= Uzaklik) And (Uzaklik < 40) Then
            MatrisUygun = 1
            MatrisEngel = 2
        End If
        If (0 <= Uzaklik) And (Uzaklik < 20) Then
            MatrisUygun = 0
            MatrisEngel = 1
        End If

        If OlcumYonu = 1 Then  'Ölçüm Yönü "1" ise
            While Isaret < MatrisUygun
                Harita(i, j + 1) = 1
                a = i
                b = j + 1
                k = 1
                Hareket(a, b, k)
                Isaret = Isaret + 1
                j = j + 1
            End While
            If MatrisEngel > 0 Then
                Harita(i, j + 1) = 0
                a = i
                b = j + 1
                k = 0
                Hareket(a, b, k)
            End If
        End If

        If OlcumYonu = 2 Then    'Ölçüm Yönü "2" ise
            While Isaret < MatrisUygun
                Harita(i + 1, j) = 1
                a = i + 1
                b = j
                k = 1
                Hareket(a, b, k)
                Isaret = Isaret + 1
                i = i + 1
            End While
            If MatrisEngel > 0 Then
                Harita(i + 1, j) = 0
                a = i + 1
                b = j
                k = 0
                Hareket(a, b, k)
            End If
        End If

        If OlcumYonu = 3 Then    'Ölçüm Yönü "3" ise
            While Isaret < MatrisUygun
                Harita(i, j - 1) = 1
                a = i
                b = j - 1
                k = 1
                Hareket(a, b, k)
                Isaret = Isaret + 1
                j = j - 1
            End While
            If MatrisEngel > 0 Then
                Harita(i, j - 1) = 0
                a = i
                b = j - 1
                k = 0
                Hareket(a, b, k)
            End If
        End If

        If OlcumYonu = 4 Then   'Ölçüm Yönü "4" ise
            While Isaret < MatrisUygun
                Harita(i - 1, j) = 1
                a = i - 1
                b = j
                k = 1
                Hareket(a, b, k)
                Isaret = Isaret + 1
                i = i - 1
            End While
            If MatrisEngel > 0 Then
                Harita(i - 1, j) = 0
                a = i - 1
                b = j
                k = 0
                Hareket(a, b, k)
            End If
        End If

    End Sub
    'Harita Tarama prosedürü
    Sub HaritaTarama()
        If Harita(x, y + 1) = 2 Then ' 1 numaralı kontrol
            Yon = 1
            KonumAyarla(Yon)
            RobotYon = Yon
            HaritaIsaretle(Yon)
        End If
        If Harita(x + 1, y) = 2 Then '2 numaralı kontrol
            Yon = 2
            KonumAyarla(Yon)
            RobotYon = Yon
            HaritaIsaretle(Yon)
        End If
        If Harita(x, y - 1) = 2 Then '3 numaralı kontrol
            Yon = 3
            KonumAyarla(Yon)
            RobotYon = Yon
            HaritaIsaretle(Yon)
        End If
        If Harita(x - 1, y) = 2 Then ' 4 numaralı kontrol
            Yon = 4
            KonumAyarla(Yon)
            RobotYon = Yon
            HaritaIsaretle(Yon)
        End If
        If Harita(x + 1, y + 1) = 2 Then '5 numaralı kontrol
            If Harita(x, y + 1) = 1 Then
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
            If Harita(x + 1, y) = 1 Then
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
        End If
        If Harita(x + 1, y - 1) = 2 Then   '6 nolu kontrol
            If Harita(x + 1, y) = 1 Then
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
            If Harita(x, y - 1) = 1 Then
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
        End If
        If Harita(x - 1, y - 1) = 2 Then  '7 nolu kontrol
            If Harita(x, y - 1) = 1 Then
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
            If Harita(x - 1, y) = 1 Then
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
        End If
        If Harita(x - 1, y + 1) = 2 Then   '8 nolu kontrol
            If Harita(x - 1, y) = 1 Then
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
            If Harita(x, y + 1) = 1 Then
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                HaritaIsaretle(Yon)
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
            End If
        End If
    End Sub
    'ilerle prosedürü
    Sub Ilerle()
        Dim kontrol As Integer
        kontrol = 0

        If (Yol(x, y + 1) = 1) And (Path(x, y + 1) < 3) Then
            Yon = 1
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            y = y + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x + 1, y + 1) = 1) And (Yol(x + 1, y) = 1) And (Path(x + 1, y + 1) < 3) Then
            Yon = 2
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            x = x + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            Yon = 1
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            y = y + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x + 1, y) = 1) And (Path(x + 1, y) < 3) Then
            Yon = 2
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            x = x + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x + 1, y - 1) = 1) And (Yol(x, y - 1) = 1) And (Path(x + 1, y - 1) < 3) Then
            Yon = 3
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            y = y - 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            Yon = 2
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            x = x + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x, y - 1) = 1) And (Path(x, y - 1) < 3) Then
            Yon = 3
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            y = y - 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x - 1, y - 1) = 1) And (Yol(x - 1, y) = 1) And (Path(x - 1, y - 1) < 3) Then
            Yon = 4
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            x = x - 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            Yon = 3
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            y = y - 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        ElseIf (Yol(x - 1, y) = 1) And (Path(x - 1, y) = 1) Then
            Yon = 4
            KonumAyarla(Yon)
            RobotYon = Yon
            IleriGit()
            x = x + 1
            Path(x, y) = 3
            TumHareket(t) = x
            TumHareket(t + 1) = y
            t = t + 2
            Rota(r) = x
            Rota(r + 1) = y
            r = r + 2
            kontrol = 1
        End If


        'Eger  daha evvel geldiği yönlar haric bir gidis yolu bulamazsa bu sefer geldiği yönü de göz önüne alarak 
        'ilerlemeye çalışır

        If kontrol = 0 Then
            If Yol(x, y + 1) = 1 Then
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x + 1, y + 1) = 1 And Yol(x + 1, y) = 1 Then
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
                Yon = 1
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x + 1, y) = 1 Then
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x + 1, y - 1) = 1 And Yol(x, y - 1) = 1 Then
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
                Yon = 2
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x, y - 1) = 1 Then
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x - 1, y - 1) = 1 And Yol(x - 1, y) = 1 Then
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x - 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
                Yon = 3
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                y = y - 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            ElseIf Yol(x - 1, y) = 1 Then
                Yon = 4
                KonumAyarla(Yon)
                RobotYon = Yon
                IleriGit()
                x = x + 1
                Path(x, y) = 3
                TumHareket(t) = x
                TumHareket(t + 1) = y
                t = t + 2
                Rota(r) = x
                Rota(r + 1) = y
                r = r + 2
            End If
        End If

    End Sub
    'prosedürler biter
    'baslangic degerleri atama

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Değişkenlerin Baslangıc değerlerini atadım
        x = 11
        y = 11
        t = 3
        r = 3
        TumHareket(1) = x
        TumHareket(2) = y
        Rota(1) = x
        Rota(2) = y
        Yon = 1
        RobotYon = 1
        Uzaklik = 45

        'Harita,Yol ve Path degiskenlerinin baslangic degeri olarak 2 atadım.
        For i = 0 To 40
            For j = 0 To 40
                Harita(i, j) = 2
                Yol(i, j) = 2
                Path(i, j) = 2
            Next
        Next
        'Harita,Yol ve Path degiskenlerinin baslangic degeri olarak 2 atadım.

        'Yol ve Path degiskenlerinin 0 - 10  31-40  aralığındaki tüm değerlerine 5 değeri atadım
        For i = 0 To 10
            For j = 0 To 40
                Yol(i, j) = 5
                Path(i, j) = 5
            Next
        Next
        For i = 31 To 40
            For j = 0 To 40
                Yol(i, j) = 5
                Path(i, j) = 5
            Next
        Next
        For j = 0 To 10
            For i = 0 To 40
                Yol(i, j) = 5
                Path(i, j) = 5
            Next
        Next
        For j = 31 To 40
            For i = 0 To 40
                Yol(i, j) = 5
                Path(i, j) = 5
            Next
        Next
        'Yol ve Path degiskenlerinin 0 - 10  31-40  aralığındaki tüm değerlerine 5 değeri atadım

        Harita(x, y) = 1
        Yol(x, y) = 1
        Path(x, y) = 3

        ' HaritaIsaretle(Yon)

        'YAZDIRMA TESTLERI
        For i = 11 To 30
            For j = 11 To 30
                'ilk parametre x, sonra y ve sonra renk.
                '  "0" Siyah renk
                '  "1" Yesil Renk
                '  "2" Beyaz Renk
                '  "3" Kırmızı Renk
                UserControl11.HaritaGoster(i - 10, j - 10, Harita(i, j))
            Next
        Next

        For i = 1 To 18 Step 2
            Rota(i) = 3
        Next
        For i = 1 To 20
            'UserControl11.HaritaGoster(i, 2, Rota(i))
        Next
        'YAZDIRMA TESTLERI


        UserControl11.HaritaGoster(x - 10, y - 10, 3)


    End Sub


End Class
