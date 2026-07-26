import networkx

openings = {
    "Italian_Game": ["e4", "e5", "Nf3", "Nc6", "Bc4"],
    "French_Defense": ["e4", "e6"],
    "Sicilian_Defense": ["e4", "c5"],
    "CaroKann_Defense": ["e4", "c6"],
    "Pirc_Defense": ["e4", "d6", "d4", "Nf6"],
    "Scandinavian_Defense": ["e4", "d5"],
    "Alekhine_Defense": ["e4", "Nf6"],
    "Modern_Defense": ["e4", "g6"],
    "Philidor_Defense": ["e4", "e5", "Nf3", "d6"],
    "Ruy_Lopez": ["e4", "e5", "Nf3", "Nc6", "Bb5"],
    "Petrov_Defense": ["e4", "e5", "Nf3", "Nf6"],
    "King_Gambit": ["e4", "e5", "f4"],
    "Vienna_Game": ["e4", "e5", "Nc3"],
    "Center_Game": ["e4", "e5", "d4", "exd4", "Qxd4"],
    "Scotch_Game": ["e4", "e5", "Nf3", "Nc6", "d4"],
    "Evans_Gambit": ["e4", "e5", "Nf3", "Nc6", "Bc4", "b5"],
    "Four_Knights_Game": ["e4", "e5", "Nf3", "Nc6", "Nc3", "Nf6"],
    "Three_Knights_Game": ["e4", "e5", "Nf3", "Nc6", "Nc3"],
    "King_Indian_Attack": ["Nf3", "d3", "g3", "Bg2", "O-O"],
    "English_Opening": ["c4"],
    "Reversed_Sicilian": ["c4", "e5"],
    "Catalan_Opening": ["d4", "Nf6", "c4", "e6", "g3"],
    "Queen_Gambit": ["d4", "d5", "c4"],
    "Queen_Gambit_Accepted": ["d4", "d5", "c4", "dxc4"],
    "Queen_Gambit_Declined": ["d4", "d5", "c4", "e6"],
    "Slav_Defense": ["d4", "d5", "c4", "c6"],
    "Semi_Slav_Defense": ["d4", "d5", "c4", "e6", "Nf3", "c6"],
    "Kings_Indian_Defense": ["d4", "Nf6", "c4", "g6"],
    "Grunfeld_Defense": ["d4", "Nf6", "c4", "g6", "Nc3", "d5"],
    "Nimzo_Indian_Defense": ["d4", "Nf6", "c4", "e6", "Nc3", "Bb4"],
    "Queen_Indian_Defense": ["d4", "Nf6", "c4", "e6", "Nf3", "b6"],
    "Bogo_Indian_Defense": ["d4", "Nf6", "c4", "e6", "Nf3", "Bb4+"],
    "Dutch_Defense": ["d4", "f5"],
    "Benoni_Defense": ["d4", "Nf6", "c4", "c5"],
    "Modern_Benoni": ["d4", "Nf6", "c4", "c5", "d5", "e6"],
    "Benko_Gambit": ["d4", "Nf6", "c4", "c5", "d5", "b5"],
    "Budapest_Gambit": ["d4", "Nf6", "c4", "e5"],
    "Trompowsky_Attack": ["d4", "Nf6", "Bg5"],
    "London_System": ["d4", "d5", "Nf3", "Nf6", "Bf4"],
    "Colle_System": ["d4", "d5", "Nf3", "e6", "e3"],
    "Jobava_London": ["d4", "d5", "Nc3", "Nf6", "Bf4"],
    "Veresov_Attack": ["d4", "d5", "Nc3"],
    "Blackmar_Diemer_Gambit": ["d4", "d5", "e4"],
    "Torre_Attack": ["d4", "Nf6", "Nf3", "e6", "Bg5"],
    "Barry_Attack": ["d4", "Nf6", "Nf3", "g6", "Nc3", "Bf4"],
    "King_Indian_Defense_Sämisch": ["d4", "Nf6", "c4", "g6", "Nc3", "d6", "f3"],
    "Tarrasch_Defense": ["d4", "d5", "c4", "e6", "Nc3", "c5"],
    "Chigorin_Defense": ["d4", "d5", "c4", "Nc6"],
    "Albin_Countergambit": ["d4", "d5", "c4", "e5"],
    "King_Indian_Attack_French": ["e4", "e6", "d3", "Nf3", "g3", "Bg2", "O-O"],
    "Hippopotamus_Defense": ["e4", "g6", "d4", "Bg7", "Nf3", "d6"],
    "Bird_Opening": ["f4"],
    "Froms_Gambit": ["f4", "e5"],
    "Larsen_Opening": ["b3"],
    "Nimzo_Larsen_Attack": ["b3", "e5", "Bb2", "Nc6", "e3", "d5", "Bb5"],
    "Sokolsky_Opening": ["b4"],
    "Grob_Attack": ["g4"],
    "Barnes_Opening": ["f3"],
    "Anderssen_Opening": ["a3"],
    "Clemenz_Opening": ["h3"],
    "Duras_Gambit": ["e4", "d5", "exd5", "Qxd5", "Nc3", "Qa5"],
    "Polish_Opening": ["b4"],
    "Hungarian_Defense": ["e4", "e5", "Nf3", "Nc6", "Be2"],
    "Kadas_Opening": ["h4"],
    "Englund_Gambit": ["d4", "e5"],
    "Monkey_Opening": ["e4", "Na6"],
    "Owen_Defense": ["e4", "b6"],
    "St_George_Defense": ["e4", "a6"],
    "Damiano_Defense": ["e4", "e5", "Nf3", "f6"],
    "MacLeod_Attack": ["e4", "e5", "Qh5"],
    "Parham_Attack": ["e4", "e5", "Qh5", "Nc6", "Bc4"],
    "Durkin_Opening": ["Na3"],
    "King_Walk_Opening": ["e4", "e5", "Ke2"],
    "Ware_Opening": ["a4"],
    "Valencia_Opening": ["c3"],
    "Desprez_Opening": ["a3", "h3"],
    "Amar_Opening": ["Nf3", "Nc6", "Na3"],
    "Mieses_Opening": ["d3"],
    "Crab_Opening": ["a4", "h4"],
    "Reversed_Alapin": ["c3", "e5"],
    "Anglo_Dutch_Defense": ["c4", "f5"],
    "Reti_Opening": ["Nf3"],
    "KIA_via_Reti": ["Nf3", "g3", "Bg2", "d3", "O-O", "e4"],
    "Catalan_via_Reti": ["Nf3", "d4", "g3", "Bg2", "c4"],
    "English_Defense": ["d4", "e6", "c4", "b6"],
    "Flohr_Mikenas_Attack": ["c4", "Nf6", "Nc3", "e6", "e4"],
    "Symmetrical_English": ["c4", "c5"],
    "King_Fianchetto": ["g3"],
    "Queen_Fianchetto": ["b3"],
    "Indian_Game": ["d4", "Nf6"],
    "Horwitz_Defense": ["e4", "e5", "Bc4", "d6"],
    "Marshall_Attack": ["e4", "e5", "Nf3", "Nc6", "Bb5", "a6", "Ba4", "Nf6", "O-O", "Be7", "c3", "d5"],
    "Sveshnikov_Sicilian": ["e4", "c5", "Nf3", "Nc6", "d4", "cxd4", "Nxd4", "Nf6", "Nc3", "e5"]
}

first_two_moves = {}
for name, moves in openings.items():
    key = f"{moves[0]} {moves[1]}" if len(moves) >= 2 else "solo 1 mossa"
    first_two_moves[name] = key

grouped = {}
for name, key in first_two_moves.items():
    grouped.setdefault(key, []).append(name)

G = networkx.Graph()
G.add_nodes_from(openings.keys())

for key, group in grouped.items():
    if key != "solo 1 mossa" and len(group) >= 2:
        for i in range(len(group)):
            for j in range(i + 1, len(group)):
                G.add_edge(group[i], group[j])

networkx.write_gexf(G, "/Users/gabrielecappelloni/Desktop/aperture.gexf")