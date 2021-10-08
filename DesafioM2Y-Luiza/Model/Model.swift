//
//  Model.swift
//  DesafioM2Y-Luiza
//
//  Created by Luiza Moruz on 07/10/21.
//  Model responsavel pela forma que lida com os dados da API

import Foundation

struct MovieData: Decodable {
    let title: String
    let voteCount: Int

    }

