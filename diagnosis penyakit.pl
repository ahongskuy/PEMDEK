% user shell
go :-

	write('****************** Diagnosis Penyakit*********************** '),nl,write('System menu'),nl,
     
    hypothesis(Pasien,Organism).
   

go :-
    write(' '),nl,
    write(''),nl.

%knowledge base

hypothesis(Pasien,demam) :-
    symptom(Pasien,diare),
    symptom(Pasien,tipes),
    symptom(Pasien,pusing),
    symptom(Pasien,mual), write_list(['pasien terkena demam']),nl,write('diagnosis untuk menganjurkan mengambil obat paracetamol'),nl.
hypothesis(Pasien,dbd) :-
    symptom(Pasien,infeksi),
    symptom(Pasien,bakteri),write_list(['pasien terkena dbd']),nl,write('pasien harus cek darah ke laboratorium'),nl.
    
    
%inference engine
symptom(Pasien,diare) :-
    write_list(['apakah pasien mengalami diare (y/n) ?']),
    response(Reply),
    Reply='y'.
symptom(Pasien,infeksi) :-
    write_list(['apakah pasien terkena infeksi (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Pasien,bakteri) :-
    write_list(['apakah pasien terkena infeksi bakteri (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Pasien,pusing) :-
    write_list(['apakah pasien merasakan pusing (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Pasien,mual) :-
    write_list(['apakah pasien mengalami mual-mual (y/n) ?']),
    response(Reply),
    Reply='y'.

write_list([]).
write_list([Term| Terms]) :-
    write(Term),
    write_list(Terms).

response(Reply) :-
    get_single_char(Code),
    put_code(Code), nl,
    char_code(Reply, Code).