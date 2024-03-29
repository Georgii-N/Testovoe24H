# Testovoe24H
 
# Краткое описание приложения

- Главный экран состоит из ленты с изображениями.
- Пользователи могут просматривать каждое изображение отдельно и делиться ссылкой на них за пределами приложения.

## Технические требования

1) Использован UIKit. Autolayout.
2) Поддерживается вертикальная и горизонтальная ориентация
3) Архитектура MVVM. Binding - на Wrappers.
4) Лента реализована на UICollectionView
5) Библиотеки: 
- Kingfisher для загрузки изображений (SPM)
- Swiftlint для кодстайла (Script)
- SwiftGen для assets, localizable (Script)
6) Дизайн:
- UIConstans - глобальный enum для всех констрейнтов
- UIFont + Extension - шрифты
- Colors, Images в Generated - цвета, изображения

## Следующая версия

- oAuth 2.0 Авторизация
- Экран профиля
- Сервис Аналитики (Amplitude), в том числе для сбора ошибок.
- Отдельный сервис обработки ошибок
- Замена Алерта на презент экрана ошибки (bottomsheet)
- Функционал лайков
