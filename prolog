min_max_avg_mode_median(List, Min, Max, Avg, Mode, Median) :-
    sort(List, SortedList),
    length(SortedList, Len),
    nth1((Len+1)//2, SortedList, Median),
    (Len mod 2 =:= 0 -> 
        N1 is Len // 2, 
        nth1(N1, SortedList, V1), 
        N2 is N1+1, 
        nth1(N2, SortedList, V2), 
        Median is (V1+V2) / 2 ; 
        true),
    sum_list(List, Sum),
    Max is max_list(List),
    Min is min_list(List),
    Avg is Sum / Len,
    aggregate(count, member(X, List), count(X, Freq)),
    max_member(Freq, Mode).
