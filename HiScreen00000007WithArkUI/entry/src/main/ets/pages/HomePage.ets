@ComponentV2
export struct HomePage {

  @Consumer('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  @Local searchText: string = ''

  @Local cards: Resource[] = [
    $r('app.media.img_demo11'),
    $r('app.media.img_demo12'),
    $r('app.media.img_demo13'),
    $r('app.media.img_demo14'),
    $r('app.media.img_demo15')
  ]

  @Local birthdayCards: Resource[] = [
    $r('app.media.img_demo16'),
    $r('app.media.img_demo17'),
    $r('app.media.img_demo18'),
    $r('app.media.img_demo19'),
    $r('app.media.img_demo13'),
    $r('app.media.img_demo14'),
    $r('app.media.img_demo15')
  ]

  @Local events: number[] = [
    0, 1, 2, 3, 4
  ]

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          // search input
          Column() {
            Search({ placeholder: 'Search cards, artists, or categories' })
              .layoutWeight(1)
              .height(40)
              .searchIcon({
                src: $r('app.media.icon_search'),
                color: '#9e9e9e'
              })
              .backgroundColor('#f6f6f6')
              .placeholderColor('#9e9e9e')
              .borderRadius(20)
              .onChange((value: string) => {
                this.searchText = value;
              })
              .onSubmit((value: string) => {
                console.info('搜索内容：', value);
              })
          }
          .width('100%')
          .height(64)
          .padding({
            left: 12,
            right: 12
          })
          .margin({
            bottom: 12
          })

          Column() {
            Row() {
              Text('Card Categories')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')

              Text('View All')
                .fontSize(14)
                .fontColor('#42767d')
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({
              top: 12,
              bottom: 12
            })
            .padding({
              left: 12,
              right: 12
            })

            Scroll() {
              Row({ space: 12 }) {
                ForEach(this.cards, (item: Resource) => {
                  Image(item)
                    .width(120)
                    .height(180)
                    .borderRadius(12)
                })
              }
              .padding({
                left: 12,
                right: 12
              })
            }
            .scrollable(ScrollDirection.Horizontal)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .width('100%')
            .height(180)
          }
          .width('100%')

          Column() {
            Row() {
              Text('Your 1 Event in June')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')

              Text('View All')
                .fontSize(14)
                .fontColor('#42767d')
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({
              top: 24,
              bottom: 12
            })
            .padding({
              left: 12,
              right: 12
            })

            Scroll() {
              Row({ space: 12 }) {
                ForEach(this.cards, (item: Resource) => {
                  Row() {
                    Column() {
                      Column() {
                        Text('JUN')
                          .fontSize(12)
                          .fontColor(Color.White)
                      }
                      .padding({
                        top: 6,
                        bottom: 6
                      })
                      .width('100%')
                      .backgroundColor('#333333')

                      Column() {
                        Text('21')
                          .fontSize(18)
                          .fontWeight(FontWeight.Bolder)
                      }
                      .margin({
                        top: 12,
                        bottom: 6
                      })

                      Column() {
                        Text('SUN')
                          .fontSize(12)
                          .fontColor('#989898')
                      }
                      .margin({
                        bottom: 6
                      })
                    }
                    .width(65)
                    .border({
                      width: 1,
                      color: '#dedede'
                    })
                    .borderRadius(6)
                    .clip(true)

                    Column() {
                      Text('Father\'s Day')
                        .fontSize(14)
                        .fontWeight(FontWeight.Bold)
                    }
                    .layoutWeight(1)
                    .alignItems(HorizontalAlign.Start)
                    .padding({
                      left: 12,
                      right: 12
                    })

                    Button() {
                      Image($r('app.media.icon_add'))
                        .width(16)
                        .height(16)
                        .fillColor('#42767d')
                    }
                    .width(36)
                    .height(36)
                    .borderRadius(18)
                    .backgroundColor('#ecf3f5')
                  }
                  .width(270)
                  .height(100)
                  .padding(8)
                  .borderRadius(12)
                  .border({
                    width: 1,
                    color: '#e6e6e6'
                  })
                  .justifyContent(FlexAlign.Start)
                  .alignItems(VerticalAlign.Center)
                })
              }
              .padding({
                left: 12,
                right: 12
              })
            }
            .scrollable(ScrollDirection.Horizontal)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .width('100%')
            .height(100)
          }
          .width('100%')

          Column() {
            Row() {
              Text('Popular Birthday Cards')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')

              Text('View All')
                .fontSize(14)
                .fontColor('#42767d')
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({
              top: 24,
            })
            .padding({
              left: 12,
              right: 12
            })

            Scroll() {
              Row({ space: 12 }) {
                ForEach(this.birthdayCards, (item: Resource) => {
                  Image(item)
                    .width(160)
                    .height(240)
                    .borderRadius(12)
                    .shadow({
                      radius: 12,
                      color: 'rgba(0, 0, 0, 0.18)',
                      offsetX: 0,
                      offsetY: 0
                    })
                })
              }
              .padding({
                left: 12,
                right: 12,
                top: 12,
                bottom: 12,
              })
            }
            .scrollable(ScrollDirection.Horizontal)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .width('100%')
            .height(264)
          }
          .width('100%')
        }
      }
      .width('100%')
      .height('100%')
      .alignSelf(ItemAlign.Start)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
      .padding({
        bottom: 32
      })
    }
    .title(this.TitleBuilder())
    .backgroundColor('#FFFFF')
  }

  @Builder
  TitleBuilder() {
    Column() {
      Text('Home')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
    }
    .padding({
      left: 12,
      right: 12
    })
  }
}