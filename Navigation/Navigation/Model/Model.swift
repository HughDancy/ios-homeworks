//
//  Modle.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import Foundation
import UIKit

struct Post {
    var title: String
}


struct ProfilePost {
    
    let title: String
    let image: String
    let briefDescription: String
    let description: String
    var likes: Int
    var views: Int
}

var posts = [
ProfilePost(
    title: "Анонсирована Death Stranding 2",
    image: "ds2",
    briefDescription: """
    Тизеры Хидео Кодзимы, которыми он делился на протяжение последних месяцев, привели к официальному анонсу DS2 - сиквелу постапокалиптического экшена Death Stranding.
    """,
    description: """
      Тизеры Хидео Кодзимы, которыми он делился на протяжение последних месяцев, привели к официальному анонсу DS2 - сиквелу постапокалиптического экшена Death Stranding. В рамках церемонии
    награждения The Game Awards 2022 был представлен дебютный трейлер игры с Фрэджайл и постаревшим Сэмом Портером Бриджесом, которых вновь сыграли Леа Сейду и Норман Ридус. Сноска в начале ролика
    уточняет, что все показанные в нем кинематографичные сцены записывались непосредственно на PlayStation 5. В качестве музыкального сопровождения была задействована новая версия темы BB Людвига
    Форсселла с вокалом Троя Бейкера.
    """,
    likes: 459,
    views: 1239
    ),

ProfilePost(
    title: "Apple запатентовала алюминиевую клавиатуру для MacBook",
    image: "apple",
    briefDescription: """
    Ведомство по патентам и товарным знакам США опубликовало новую заявку Apple, в которой описана технология новой клавиатуры для MacBook.
    """,
    description: """
    Ведомство по патентам и товарным знакам США опубликовало новую заявку Apple, в которой описана технология новой клавиатуры для MacBook. Нет, возвращать «бабочку» никто не планирует.
    В патенте речь о металлических клавишах со светодиодами внутри. Никакой гравировки не будет — все символы будут подсвечиваться. Благодаря этому можно установить любой язык, и символы
    автоматически «подтянутся. Также благодаря встроенным светодиодам исчезнут засветы по краям, которые сейчас можно увидеть на любом MacBook.
    """,
    likes: 652,
    views: 1195
    ),

ProfilePost(
    title: "Учёные разработали натрий-серную батарею",
    image: "battarey",
    briefDescription: """
    Команда учёных из Китая и Австралии нашла способ улучшить натрий-серные батареи.
    """,
    description: """
      Команда учёных из Китая и Австралии нашла способ улучшить натрий-серные батареи.
      В разработанных батареях используются электроды на основе углерода и процесс термического разложения, чтобы изменить реакцию между натрием и серой. Это позволило увеличить ёмкость батарей и
    продлить их срок службы, чем не могли похвастаться натрий-серные батареи.
      В результате получилась батарея ёмкостью 1017 мА·ч/г при комнатной температуре, что в четыре раза больше, чем у литий-ионной батареи. Натрий-серная батарея сохранила около половины этой ёмкости
    после 1000 циклов перезарядки.
    """,
    likes: 666,
    views: 1908
    ),

ProfilePost(
    title: "Microsoft теряет до $200 на каждой проданной консоли Xbox Series",
    image: "xbox",
    briefDescription:  """
    Консоли Xbox Series компания Microsoft реализует в большой минус.
    """,
    description: """
    Консоли Xbox Series компания Microsoft реализует в большой минус. Об этом сообщает издание EuroGamer со ссылкой на интервью Фила Спенсера телеканалу CNBC.
    Интересно, что убыток от дешёвой консоли больше: $100 на Xbox Series X (стоит в США $499) и $200 на Xbox Series S (стоит в США $299).
    Собственно, такая практика — нормальная для игровой индустрии. Все компании, кроме Nintendo, продают свои консоли в минус. Деньги они получают с подписок и продаж аксессуаров.
    Однако с оглядкой на инфляцию и кризис, компании вынуждены идти на повышение цен. Так, Sony повысила цены на PlayStation в большинстве регионов, кроме США, объяснив это инфляцией:
    """,
    likes: 589,
    views: 968
    ),

ProfilePost(
    title: "Apple выпустила первую бету iOS 16.3",
    image: "ios",
    briefDescription: """
    В системе появилась поддержка аппаратных ключей безопасности для дополнительной защиты аккаунта Apple ID.
    """,
    description: """
    В системе появилась поддержка аппаратных ключей безопасности для дополнительной защиты аккаунта Apple ID.
    Ключи безопасности предназначены для замены проверочных кодов, которые отправляются на устройства Apple при входе в аккаунт на другом девайсе.
    Пока функция в бете, а настроить её можно в меню аккаунта Apple ID. Функция также появилась в первых бетах iPadOS 16.3 и в macOS Ventura 13.2. Все системы поддерживают только сертифицированные ключи безопасности FIDO.
    """,
    likes: 971,
    views: 1257
    )
]

let photos = [
    UIImage(named: "Dostoevsky"),
    UIImage(named: "matew"),
    UIImage(named: "bulgakov"),
    UIImage(named: "haley"),
    UIImage(named: "hotWater"),
    UIImage(named: "paramore"),
    UIImage(named: "monica"),
    UIImage(named: "phoenix"),
    UIImage(named: "gadot"),
    UIImage(named: "margo"),
    UIImage(named: "macProging"),
    UIImage(named: "piter"),
    UIImage(named: "moscow"),
    UIImage(named: "thai"),
    UIImage(named: "amazonian"),
    UIImage(named: "ds2"),
    UIImage(named: "apple"),
    UIImage(named: "battarey"),
    UIImage(named: "xbox"),
    UIImage(named: "ios"),
    UIImage(named: "eva"),
    UIImage(named: "corey"),
    UIImage(named: "curt"),
    UIImage(named: "roar"),
    UIImage(named: "bring"),
    UIImage(named: "bukowsky"),
    UIImage(named: "keanu"),
    UIImage(named: "architects"),
    UIImage(named: "sam"),
    UIImage(named: "dicon"),
    UIImage(named: "sekiro"),
    UIImage(named: "aloy"),
    UIImage(named: "snake"),
    UIImage(named: "doomslayer"),
    UIImage(named: "slipknot"),
    UIImage(named: "jobs")
]
