library(igraph)
library(RColorBrewer)

openings <- list(
  "Italian_Game" = c("e4", "e5", "Nf3", "Nc6", "Bc4"),
  "French_Defense" = c("e4", "e6"),
  "Sicilian_Defense" = c("e4", "c5"),
  "CaroKann_Defense" = c("e4", "c6"),
  "Pirc_Defense" = c("e4", "d6", "d4", "Nf6"),
  "Scandinavian_Defense" = c("e4", "d5"),
  "Alekhine_Defense" = c("e4", "Nf6"),
  "Modern_Defense" = c("e4", "g6"),
  "Philidor_Defense" = c("e4", "e5", "Nf3", "d6"),
  "Ruy_Lopez" = c("e4", "e5", "Nf3", "Nc6", "Bb5"),
  "Petrov_Defense" = c("e4", "e5", "Nf3", "Nf6"),
  "King_Gambit" = c("e4", "e5", "f4"),
  "Vienna_Game" = c("e4", "e5", "Nc3"),
  "Center_Game" = c("e4", "e5", "d4", "exd4", "Qxd4"),
  "Scotch_Game" = c("e4", "e5", "Nf3", "Nc6", "d4"),
  "Evans_Gambit" = c("e4", "e5", "Nf3", "Nc6", "Bc4", "b5"),
  "Four_Knights_Game" = c("e4", "e5", "Nf3", "Nc6", "Nc3", "Nf6"),
  "Three_Knights_Game" = c("e4", "e5", "Nf3", "Nc6", "Nc3"),
  "King_Indian_Attack" = c("Nf3", "d3", "g3", "Bg2", "O-O"),
  "English_Opening" = c("c4"),
  "Reversed_Sicilian" = c("c4", "e5"),
  "Catalan_Opening" = c("d4", "Nf6", "c4", "e6", "g3"),
  "Queen_Gambit" = c("d4", "d5", "c4"),
  "Queen_Gambit_Accepted" = c("d4", "d5", "c4", "dxc4"),
  "Queen_Gambit_Declined" = c("d4", "d5", "c4", "e6"),
  "Slav_Defense" = c("d4", "d5", "c4", "c6"),
  "Semi_Slav_Defense" = c("d4", "d5", "c4", "e6", "Nf3", "c6"),
  "Kings_Indian_Defense" = c("d4", "Nf6", "c4", "g6"),
  "Grunfeld_Defense" = c("d4", "Nf6", "c4", "g6", "Nc3", "d5"),
  "Nimzo_Indian_Defense" = c("d4", "Nf6", "c4", "e6", "Nc3", "Bb4"),
  "Queen_Indian_Defense" = c("d4", "Nf6", "c4", "e6", "Nf3", "b6"),
  "Bogo_Indian_Defense" = c("d4", "Nf6", "c4", "e6", "Nf3", "Bb4+"),
  "Dutch_Defense" = c("d4", "f5"),
  "Benoni_Defense" = c("d4", "Nf6", "c4", "c5"),
  "Modern_Benoni" = c("d4", "Nf6", "c4", "c5", "d5", "e6"),
  "Benko_Gambit" = c("d4", "Nf6", "c4", "c5", "d5", "b5"),
  "Budapest_Gambit" = c("d4", "Nf6", "c4", "e5"),
  "Trompowsky_Attack" = c("d4", "Nf6", "Bg5"),
  "London_System" = c("d4", "d5", "Nf3", "Nf6", "Bf4"),
  "Colle_System" = c("d4", "d5", "Nf3", "e6", "e3"),
  "Jobava_London" = c("d4", "d5", "Nc3", "Nf6", "Bf4"),
  "Veresov_Attack" = c("d4", "d5", "Nc3"),
  "Blackmar_Diemer_Gambit" = c("d4", "d5", "e4"),
  "Torre_Attack" = c("d4", "Nf6", "Nf3", "e6", "Bg5"),
  "Barry_Attack" = c("d4", "Nf6", "Nf3", "g6", "Nc3", "Bf4"),
  "King_Indian_Defense_Sämisch" = c("d4", "Nf6", "c4", "g6", "Nc3", "d6", "f3"),
  "Tarrasch_Defense" = c("d4", "d5", "c4", "e6", "Nc3", "c5"),
  "Chigorin_Defense" = c("d4", "d5", "c4", "Nc6"),
  "Albin_Countergambit" = c("d4", "d5", "c4", "e5"),
  "King_Indian_Attack_French" = c("e4", "e6", "d3", "Nf3", "g3", "Bg2", "O-O"),
  "Hippopotamus_Defense" = c("e4", "g6", "d4", "Bg7", "Nf3", "d6"),
  "Bird_Opening" = c("f4"),
  "Froms_Gambit" = c("f4", "e5"),
  "Larsen_Opening" = c("b3"),
  "Nimzo_Larsen_Attack" = c("b3", "e5", "Bb2", "Nc6", "e3", "d5", "Bb5"),
  "Sokolsky_Opening" = c("b4"),
  "Grob_Attack" = c("g4"),
  "Barnes_Opening" = c("f3"),
  "Anderssen_Opening" = c("a3"),
  "Clemenz_Opening" = c("h3"),
  "Duras_Gambit" = c("e4", "d5", "exd5", "Qxd5", "Nc3", "Qa5"),
  "Polish_Opening" = c("b4"),
  "Hungarian_Defense" = c("e4", "e5", "Nf3", "Nc6", "Be2"),
  "Kadas_Opening" = c("h4"),
  "Englund_Gambit" = c("d4", "e5"),
  "Monkey_Opening" = c("e4", "Na6"),
  "Owen_Defense" = c("e4", "b6"),
  "St_George_Defense" = c("e4", "a6"),
  "Damiano_Defense" = c("e4", "e5", "Nf3", "f6"),
  "MacLeod_Attack" = c("e4", "e5", "Qh5"),
  "Parham_Attack" = c("e4", "e5", "Qh5", "Nc6", "Bc4"),
  "Durkin_Opening" = c("Na3"),
  "King_Walk_Opening" = c("e4", "e5", "Ke2"),
  "Ware_Opening" = c("a4"),
  "Valencia_Opening" = c("c3"),
  "Desprez_Opening" = c("a3", "h3"),
  "Amar_Opening" = c("Nf3", "Nc6", "Na3"),
  "Mieses_Opening" = c("d3"),
  "Crab_Opening" = c("a4", "h4"),
  "Reversed_Alapin" = c("c3", "e5"),
  "Anglo_Dutch_Defense" = c("c4", "f5"),
  "Reti_Opening" = c("Nf3"),
  "KIA_via_Reti" = c("Nf3", "g3", "Bg2", "d3", "O-O", "e4"),
  "Catalan_via_Reti" = c("Nf3", "d4", "g3", "Bg2", "c4"),
  "English_Defense" = c("d4", "e6", "c4", "b6"),
  "Flohr_Mikenas_Attack" = c("c4", "Nf6", "Nc3", "e6", "e4"),
  "Symmetrical_English" = c("c4", "c5"),
  "King_Fianchetto" = c("g3"),
  "Queen_Fianchetto" = c("b3"),
  "Indian_Game" = c("d4", "Nf6"),
  "Horwitz_Defense" = c("e4", "e5", "Bc4", "d6"),
  "Marshall_Attack" = c("e4", "e5", "Nf3", "Nc6", "Bb5", "a6", "Ba4", "Nf6", "O-O", "Be7", "c3", "d5"),
  "Sveshnikov_Sicilian" = c("e4", "c5", "Nf3", "Nc6", "d4", "cxd4", "Nxd4", "Nf6", "Nc3", "e5")
)

first_two_moves <- sapply(openings, function(moves) {
  if(length(moves) >= 2) {
    paste(moves[1:2], collapse = " ")
  } else {
    "solo 1 mossa"
  }
})

grouped <- split(names(first_two_moves), first_two_moves)

edges <- list()
for(key in names(grouped)) {
  group <- grouped[[key]]
  if(key != "solo 1 mossa" && length(group) >= 2) {
    combs <- combn(group, 2, simplify = FALSE)
    edges <- append(edges, combs)
  }
}

g <- make_empty_graph(directed = FALSE) + vertices(names(openings))

if(length(edges) > 0) {
  edge_matrix <- do.call(rbind, edges)
  g <- add_edges(g, t(edge_matrix))
}

unique_keys <- unique(first_two_moves)
unique_keys_ordered <- c(setdiff(unique_keys, "solo 1 mossa"), "solo 1 mossa")

n_groups <- length(unique_keys_ordered) - 1  
available_colors <- brewer.pal.info[brewer.pal.info$category == 'qual', ]
max_colors <- max(available_colors$maxcolors)
palette_name <- rownames(available_colors[which.max(available_colors$maxcolors), ])

if (n_groups <= max_colors) {
  group_colors <- brewer.pal(n_groups, palette_name)
} else {
  group_colors <- colorRampPalette(brewer.pal(max_colors, palette_name))(n_groups)
}

assigned_colors <- c(group_colors, "gray50")
names(assigned_colors) <- unique_keys_ordered

V(g)$color <- assigned_colors[first_two_moves[V(g)$name]]

legend_labels <- unique_keys_ordered
legend_labels[length(legend_labels)] <- "nodi isolati"  

legend_colors <- assigned_colors[unique_keys_ordered]

plot(g,
     main = "Grafo delle aperture (prime due mosse)",
     layout = layout_with_kk(g),
     vertex.size = 14,
     vertex.label = V(g)$label,
     vertex.label.cex = 0.7,
     vertex.label.dist = 1.5,
     vertex.label.color = "black",
     edge.arrow.size = 0.1)

legend(x = -1.8, y = 1.1,
       legend = legend_labels,
       col = legend_colors,
       pch = 19,
       title = "Prime due mosse",
       cex = 0.7,
       pt.cex = 1,
       bty = "n")

