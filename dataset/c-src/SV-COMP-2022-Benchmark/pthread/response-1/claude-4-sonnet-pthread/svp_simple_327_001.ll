; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@i = global i32 3, align 4, !dbg !0
@j = global i32 6, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_327_001_isr_1(i8* %0) #0 !dbg !20 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %3, metadata !26, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %3, align 4, !dbg !28
  br label %4, !dbg !29

4:                                                ; preds = %10, %1
  %5 = load i32, i32* %3, align 4, !dbg !30
  %6 = icmp slt i32 %5, 5, !dbg !32
  br i1 %6, label %7, label %13, !dbg !33

7:                                                ; preds = %4
  %8 = load i32, i32* @j, align 4, !dbg !34
  %9 = add nsw i32 %8, 1, !dbg !36
  store i32 %9, i32* @i, align 4, !dbg !37
  br label %10, !dbg !38

10:                                               ; preds = %7
  %11 = load i32, i32* %3, align 4, !dbg !39
  %12 = add nsw i32 %11, 1, !dbg !39
  store i32 %12, i32* %3, align 4, !dbg !39
  br label %4, !dbg !40, !llvm.loop !41

13:                                               ; preds = %4
  ret void, !dbg !43
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_327_001_isr_2(i8* %0) #0 !dbg !44 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %3, metadata !47, metadata !DIExpression()), !dbg !49
  store i32 0, i32* %3, align 4, !dbg !49
  br label %4, !dbg !50

4:                                                ; preds = %10, %1
  %5 = load i32, i32* %3, align 4, !dbg !51
  %6 = icmp slt i32 %5, 5, !dbg !53
  br i1 %6, label %7, label %13, !dbg !54

7:                                                ; preds = %4
  %8 = load i32, i32* @i, align 4, !dbg !55
  %9 = add nsw i32 %8, 1, !dbg !57
  store i32 %9, i32* @j, align 4, !dbg !58
  br label %10, !dbg !59

10:                                               ; preds = %7
  %11 = load i32, i32* %3, align 4, !dbg !60
  %12 = add nsw i32 %11, 1, !dbg !60
  store i32 %12, i32* %3, align 4, !dbg !60
  br label %4, !dbg !61, !llvm.loop !62

13:                                               ; preds = %4
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_327_001_main(i32 %0, i8** %1) #0 !dbg !65 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %6, metadata !75, metadata !DIExpression()), !dbg !76
  %8 = load i32, i32* @i, align 4, !dbg !77
  %9 = icmp sgt i32 %8, 16, !dbg !78
  %10 = zext i1 %9 to i32, !dbg !78
  store i32 %10, i32* %6, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %7, metadata !79, metadata !DIExpression()), !dbg !80
  %11 = load i32, i32* @j, align 4, !dbg !81
  %12 = icmp sgt i32 %11, 16, !dbg !82
  %13 = zext i1 %12 to i32, !dbg !82
  store i32 %13, i32* %7, align 4, !dbg !80
  %14 = load i32, i32* %6, align 4, !dbg !83
  %15 = icmp ne i32 %14, 0, !dbg !83
  br i1 %15, label %19, label %16, !dbg !85

16:                                               ; preds = %2
  %17 = load i32, i32* %7, align 4, !dbg !86
  %18 = icmp ne i32 %17, 0, !dbg !86
  br i1 %18, label %19, label %21, !dbg !87

19:                                               ; preds = %16, %2
  br label %20, !dbg !88

20:                                               ; preds = %19
  call void @llvm.dbg.label(metadata !89), !dbg !91
  call void @reach_error(), !dbg !92
  call void @abort() #4, !dbg !94
  unreachable, !dbg !94

21:                                               ; preds = %16
  %22 = load i32, i32* %3, align 4, !dbg !95
  ret i32 %22, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "j", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 7, type: !16, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 7, column: 22, scope: !15)
!19 = !DILocation(line: 7, column: 33, scope: !15)
!20 = distinct !DISubprogram(name: "svp_simple_327_001_isr_1", scope: !8, file: !8, line: 14, type: !21, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DILocalVariable(name: "arg", arg: 1, scope: !20, file: !8, line: 14, type: !23)
!25 = !DILocation(line: 14, column: 37, scope: !20)
!26 = !DILocalVariable(name: "k", scope: !27, file: !8, line: 15, type: !9)
!27 = distinct !DILexicalBlock(scope: !20, file: !8, line: 15, column: 3)
!28 = !DILocation(line: 15, column: 12, scope: !27)
!29 = !DILocation(line: 15, column: 8, scope: !27)
!30 = !DILocation(line: 15, column: 19, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !8, line: 15, column: 3)
!32 = !DILocation(line: 15, column: 21, scope: !31)
!33 = !DILocation(line: 15, column: 3, scope: !27)
!34 = !DILocation(line: 16, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 15, column: 33)
!36 = !DILocation(line: 16, column: 11, scope: !35)
!37 = !DILocation(line: 16, column: 7, scope: !35)
!38 = !DILocation(line: 17, column: 3, scope: !35)
!39 = !DILocation(line: 15, column: 29, scope: !31)
!40 = !DILocation(line: 15, column: 3, scope: !31)
!41 = distinct !{!41, !33, !42}
!42 = !DILocation(line: 17, column: 3, scope: !27)
!43 = !DILocation(line: 19, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "svp_simple_327_001_isr_2", scope: !8, file: !8, line: 21, type: !21, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocalVariable(name: "arg", arg: 1, scope: !44, file: !8, line: 21, type: !23)
!46 = !DILocation(line: 21, column: 37, scope: !44)
!47 = !DILocalVariable(name: "k", scope: !48, file: !8, line: 22, type: !9)
!48 = distinct !DILexicalBlock(scope: !44, file: !8, line: 22, column: 3)
!49 = !DILocation(line: 22, column: 12, scope: !48)
!50 = !DILocation(line: 22, column: 8, scope: !48)
!51 = !DILocation(line: 22, column: 19, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !8, line: 22, column: 3)
!53 = !DILocation(line: 22, column: 21, scope: !52)
!54 = !DILocation(line: 22, column: 3, scope: !48)
!55 = !DILocation(line: 23, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !8, line: 22, column: 33)
!57 = !DILocation(line: 23, column: 11, scope: !56)
!58 = !DILocation(line: 23, column: 7, scope: !56)
!59 = !DILocation(line: 24, column: 3, scope: !56)
!60 = !DILocation(line: 22, column: 29, scope: !52)
!61 = !DILocation(line: 22, column: 3, scope: !52)
!62 = distinct !{!62, !54, !63}
!63 = !DILocation(line: 24, column: 3, scope: !48)
!64 = !DILocation(line: 26, column: 1, scope: !44)
!65 = distinct !DISubprogram(name: "svp_simple_327_001_main", scope: !8, file: !8, line: 28, type: !66, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !8, line: 28, type: !9)
!72 = !DILocation(line: 28, column: 33, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !8, line: 28, type: !68)
!74 = !DILocation(line: 28, column: 46, scope: !65)
!75 = !DILocalVariable(name: "condI", scope: !65, file: !8, line: 30, type: !9)
!76 = !DILocation(line: 30, column: 7, scope: !65)
!77 = !DILocation(line: 30, column: 15, scope: !65)
!78 = !DILocation(line: 30, column: 17, scope: !65)
!79 = !DILocalVariable(name: "condJ", scope: !65, file: !8, line: 31, type: !9)
!80 = !DILocation(line: 31, column: 7, scope: !65)
!81 = !DILocation(line: 31, column: 15, scope: !65)
!82 = !DILocation(line: 31, column: 17, scope: !65)
!83 = !DILocation(line: 33, column: 7, scope: !84)
!84 = distinct !DILexicalBlock(scope: !65, file: !8, line: 33, column: 7)
!85 = !DILocation(line: 33, column: 13, scope: !84)
!86 = !DILocation(line: 33, column: 16, scope: !84)
!87 = !DILocation(line: 33, column: 7, scope: !65)
!88 = !DILocation(line: 33, column: 23, scope: !84)
!89 = !DILabel(scope: !90, name: "ERROR", file: !8, line: 34)
!90 = distinct !DILexicalBlock(scope: !84, file: !8, line: 33, column: 23)
!91 = !DILocation(line: 34, column: 5, scope: !90)
!92 = !DILocation(line: 34, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !8, line: 34, column: 12)
!94 = !DILocation(line: 34, column: 27, scope: !93)
!95 = !DILocation(line: 37, column: 1, scope: !65)
