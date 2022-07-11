//
//  HomeView.swift
//  rentX
//
//  Created by Bruno Gabriel on 10/03/22.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: -44) {
                HStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140)
                        .padding(.horizontal, 20)
                        .padding(.top, 46)
                    
                    Spacer()
                    
                    Text("Total de 12 carros")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.top, 46)
                }
                .frame(maxWidth: .infinity, maxHeight: 140)
                .background(ThemeColors.BACKGROUND_SECONDARY)
                .cornerRadius(6, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea(.all)
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(homeViewModel.cars) {   car in
                            NavigationLink(destination: CarDetailsView(car: car), label: {
                                CarItemView(car: car)
                                    .padding(.top)
                            })
                                .navigationTitle("")
                                .navigationBarHidden(true)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(ThemeColors.BACKGROUND_PRIMARY)
                }
                .foregroundColor(.red)
            }
            .background(.regularMaterial)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
