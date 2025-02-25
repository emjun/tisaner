#' Infer Statistical Model from Design Function
#'
#' This function infers a statistical model from a study design.
#' @param design 
#' @keywords statistical model
# infer_statistical_model_from_design()
infer_statistical_model_from_design <- function(design){
    ### Step 0: Construct graph
    # Infer has relationships
    has_relationships <- infer_has_relationships(design=design)

    # Combine all relationships
    all_relationships <- append(design@relationships, has_relationships)

    # Construct graph from relationships
    vars <- get_all_vars(design=design)
    graphs <- construct_graphs(all_relationships, vars)
    causal_gr <- graphs[[1]]
    associative_gr <- graphs[[2]]
    measurement_gr <- graphs[[3]]
    nests_gr <- graphs[[4]]

    ### Step 1: Initial conceptual checks
    check_conceptual_relationships(causal_gr, assocative_gr)

    ### Step 2: Candidate statistical model inference/generation
    main_effects <- infer_main_effects_with_explanations(causal_gr, associative_gr, design)
    interaction_effects <- infer_interaction_effects_with_explanations(causal_gr, associative_gr, design, main_effects)
    random_effects <- infer_random_effects_with_explanations(measurement_gr, nests_gr, design, all_relationships, main_effects, interaction_effects)

    family_functions <- infer_family_functions()
    link_functions <- infer_link_functions()

    # Output JSON file
    json_file <- NULL

    ### Step 3: Disambiguation loop (GUI)
    # TODO: Call bash script to run GUI

    ### Step 4: Code generation
    # TODO: Generate code
}