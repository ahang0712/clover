; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_326_001.ll'
source_filename = "./dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_326_001_filtered.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@num = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !14 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_326_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !19 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !23, metadata !DIExpression()), !dbg !24
  br label %4, !dbg !25

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !26
  %6 = icmp sgt i32 %5, 0, !dbg !27
  br i1 %6, label %7, label %11, !dbg !25

7:                                                ; preds = %4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !28, metadata !DIExpression()), !dbg !30
  %8 = load i32, i32* @num, align 4, !dbg !31
  %9 = sub nsw i32 %8, 1, !dbg !32
  store i32 %9, i32* %3, align 4, !dbg !30
  %10 = load i32, i32* %3, align 4, !dbg !33
  store i32 %10, i32* @num, align 4, !dbg !34
  br label %4, !dbg !25, !llvm.loop !35

11:                                               ; preds = %4
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_326_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !38 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !39, metadata !DIExpression()), !dbg !40
  br label %4, !dbg !41

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !42
  %6 = icmp eq i32 %5, 0, !dbg !43
  br i1 %6, label %7, label %11, !dbg !41

7:                                                ; preds = %4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !44, metadata !DIExpression()), !dbg !46
  %8 = load i32, i32* @num, align 4, !dbg !47
  %9 = sub nsw i32 %8, 1, !dbg !48
  store i32 %9, i32* %3, align 4, !dbg !46
  %10 = load i32, i32* %3, align 4, !dbg !49
  store i32 %10, i32* @num, align 4, !dbg !50
  br label %4, !dbg !41, !llvm.loop !51

11:                                               ; preds = %4
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_326_001_main() local_unnamed_addr #0 !dbg !54 {
  store i32 1, i32* @num, align 4, !dbg !57
  %1 = load i32, i32* @num, align 4, !dbg !58
  %2 = icmp ne i32 %1, 1, !dbg !60
  br i1 %2, label %3, label %5, !dbg !61

3:                                                ; preds = %0
  br label %4, !dbg !62

4:                                                ; preds = %3
  call void @llvm.dbg.label(metadata !63), !dbg !65
  call void @reach_error(), !dbg !66
  call void @abort() #4, !dbg !68
  unreachable, !dbg !68

5:                                                ; preds = %0
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "num", scope: !2, file: !6, line: 3, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_326_001_filtered.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "./dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_326_001_filtered.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !15, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 2, column: 22, scope: !14)
!18 = !DILocation(line: 2, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "svp_simple_326_001_isr_1", scope: !6, file: !6, line: 4, type: !20, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DILocalVariable(name: "arg", arg: 1, scope: !19, file: !6, line: 4, type: !22)
!24 = !DILocation(line: 4, column: 38, scope: !19)
!25 = !DILocation(line: 6, column: 3, scope: !19)
!26 = !DILocation(line: 6, column: 10, scope: !19)
!27 = !DILocation(line: 6, column: 14, scope: !19)
!28 = !DILocalVariable(name: "tmp", scope: !29, file: !6, line: 7, type: !7)
!29 = distinct !DILexicalBlock(scope: !19, file: !6, line: 6, column: 19)
!30 = !DILocation(line: 7, column: 9, scope: !29)
!31 = !DILocation(line: 7, column: 15, scope: !29)
!32 = !DILocation(line: 7, column: 18, scope: !29)
!33 = !DILocation(line: 8, column: 9, scope: !29)
!34 = !DILocation(line: 8, column: 8, scope: !29)
!35 = distinct !{!35, !25, !36}
!36 = !DILocation(line: 9, column: 3, scope: !19)
!37 = !DILocation(line: 10, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "svp_simple_326_001_isr_2", scope: !6, file: !6, line: 11, type: !20, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocalVariable(name: "arg", arg: 1, scope: !38, file: !6, line: 11, type: !22)
!40 = !DILocation(line: 11, column: 38, scope: !38)
!41 = !DILocation(line: 13, column: 3, scope: !38)
!42 = !DILocation(line: 13, column: 10, scope: !38)
!43 = !DILocation(line: 13, column: 14, scope: !38)
!44 = !DILocalVariable(name: "tmp", scope: !45, file: !6, line: 14, type: !7)
!45 = distinct !DILexicalBlock(scope: !38, file: !6, line: 13, column: 20)
!46 = !DILocation(line: 14, column: 9, scope: !45)
!47 = !DILocation(line: 14, column: 15, scope: !45)
!48 = !DILocation(line: 14, column: 18, scope: !45)
!49 = !DILocation(line: 15, column: 9, scope: !45)
!50 = !DILocation(line: 15, column: 8, scope: !45)
!51 = distinct !{!51, !41, !52}
!52 = !DILocation(line: 16, column: 3, scope: !38)
!53 = !DILocation(line: 17, column: 1, scope: !38)
!54 = distinct !DISubprogram(name: "svp_simple_326_001_main", scope: !6, file: !6, line: 18, type: !55, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!7}
!57 = !DILocation(line: 20, column: 7, scope: !54)
!58 = !DILocation(line: 21, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !6, line: 21, column: 7)
!60 = !DILocation(line: 21, column: 10, scope: !59)
!61 = !DILocation(line: 21, column: 7, scope: !54)
!62 = !DILocation(line: 22, column: 3, scope: !59)
!63 = !DILabel(scope: !64, name: "ERROR", file: !6, line: 23)
!64 = distinct !DILexicalBlock(scope: !59, file: !6, line: 22, column: 3)
!65 = !DILocation(line: 23, column: 5, scope: !64)
!66 = !DILocation(line: 23, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !6, line: 23, column: 12)
!68 = !DILocation(line: 23, column: 27, scope: !67)
!69 = !DILocation(line: 25, column: 3, scope: !54)
