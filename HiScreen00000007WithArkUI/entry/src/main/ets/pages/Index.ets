import { HomePage } from './HomePage';

@Entry
@ComponentV2
struct Index {
  @Local currentNavIndex: number = 0

  @Provider('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      HomePage()
    } else if (name === 'pageTwo') {
      HomePage()
    }
  }

  @Builder
  TabBuilder(title: string, index: number, normalIcon: Resource, selectedIcon: Resource) {
    Column() {
      Image(this.currentNavIndex === index ? selectedIcon : normalIcon)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)
        .fillColor(this.currentNavIndex === index ? '#333333' : '#333333')

      Text(title)
        .fontSize(12)
        .fontColor(this.currentNavIndex === index ? '#333333' : '#6f6f6f')
        .margin({ top: 4 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Navigation(this.pageInfos) {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder(
          'Home',
          0,
          $r('app.media.icon_home'),
          $r('app.media.icon_home_fill')
        ))

        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder(
          'Events',
          1,
          $r('app.media.icon_calendar'),
          $r('app.media.icon_calendar_fill')
        ))

        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder(
          'Gifts',
          2,
          $r('app.media.icon_store'),
          $r('app.media.icon_store_fill')
        ))

        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder(
          'Inbox',
          3,
          $r('app.media.icon_mail'),
          $r('app.media.icon_mail_fill')
        ))

        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder(
          'Profile',
          4,
          $r('app.media.icon_user'),
          $r('app.media.icon_user_fill')
        ))
      }
      .barHeight(56)
      .onChange((index: number) => {
        this.currentNavIndex = index
      })
    }
    .hideTitleBar(true)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.PageMap)
    .hideBackButton(false)
  }
}

