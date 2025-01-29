//
//  Home.swift
//  Books
//
//  Created by 伊藤璃乃 on 2025/01/24.
//

import SwiftUI

struct Home: View {
    @State var currentBook: Book = sampleBooks.first!
    var body: some View {
        VStack {
            HeaderView()
            BookSlider()
            BookDetailView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    @ViewBuilder
    func BookDetailView() -> some View {
        VStack {
            GeometryReader {
                let size = $0.size

                HStack(spacing: 0){
                    ForEach(sampleBooks) { book in
                        let index = indexOf(book : book)
                        let currentIndex = indexOf(book : currentBook)

                        VStack(alignment: .leading, spacing: 18) {
                            Text(book.title)
                                .font(.largeTitle)
                                .foregroundStyle(Color.black.opacity(0.7))
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex < index ? 0.1 : 0), value: currentIndex == index)
                            Text("By \(book.author)")
                                .font(.callout)
                                .foregroundStyle(.gray)
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex > index ? 0.1 : 0), value: currentIndex == index)
                            Text("\(book.title)")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex > index ? 0.1 : 0), value: currentIndex == index)
                        }
                        .frame(width: size.width + 30, alignment: .leading)
                    }
                }


            }
            .padding(.horizontal, 15)
            .frame(height: 100)
            .padding(.bottom, 10)

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.4))

                GeometryReader {
                    let size = $0.size
                    Capsule()
                        .fill(Color.green)
                        .frame(width: CGFloat(indexOf(book: currentBook)) / CGFloat(sampleBooks.count - 1 ) * size.width)
                        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.75, blendDuration: 0.75), value: currentBook)
                }
            }
            .frame(height: 4)
            .padding(.top, 10)
            .padding([.horizontal, .bottom], 15)
        }
    }

    func indexOf(book: Book) -> Int {
        if let index = sampleBooks.firstIndex(of: book) {
            return index
        }
        return 0
    }


    @ViewBuilder
    func BookSlider() -> some View {
        TabView(selection: $currentBook) {
            ForEach(sampleBooks) { book in
                BookView(book: book)
                    .tag(book)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    @ViewBuilder
    func BookView(book: Book) -> some View {
        GeometryReader {
            let size = $0.size

            let rect = $0.frame(in: .global)
            let minX = (rect.minX - 50) < 0 ? (rect.minX - 50) : -(rect.minX - 50)
            let progress = (minX) / rect.width
            let rotation = progress * 45

            ZStack {
                IsometricView(depth: 10) {
                    Color.white
                } bottom: {
                    Color.white
                } side: {
                    Color.white
                }
                .frame(width: size.width / 1.2, height: size.height / 1.5)
                .shadow(color: .black.opacity(0.12), radius: 5, x: 15, y: 8)
                .shadow(color: .black.opacity(0.1), radius: 6, x: -10, y: -8)

                Image(book.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width / 1.2, height: size.height / 1.5)
                    .clipped()
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 10, y: 8)
                    .rotation3DEffect(.init(degrees: rotation), axis: (x: 0, y: 1, z: 0), anchor: .leading, perspective: 1)
                    .modifier(CustomProjection(value: 1 + (-progress < 1 ? progress : -1.0)))

            }
            .offset(x: indexOf(book: book) > 0 ? -(progress * 45) : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal, 50)
    }


    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 15) {
            Text("Bookio")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.black.opacity(0.7))
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {}) {
                Image(systemName: "books.vertical")
                    .font(.title3)
                    .foregroundStyle(Color.gray)
            }
            Button(action: {}) {
                Image(systemName: "book.closed")
                    .font(.title3)
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(15)
    }
}

#Preview {
    Home()
}
