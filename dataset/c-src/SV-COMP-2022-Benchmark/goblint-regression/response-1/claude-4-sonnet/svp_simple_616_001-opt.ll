; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_616_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_616_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common local_unnamed_addr global i32 0, align 4, !dbg !0
@g2 = common local_unnamed_addr global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) local_unnamed_addr #0 !dbg !20 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !23, metadata !DIExpression()), !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !25
  %4 = icmp ne i32 %3, 0, !dbg !27
  br i1 %4, label %7, label %5, !dbg !28

5:                                                ; preds = %1
  br label %6, !dbg !29

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !30), !dbg !32
  call void @reach_error(), !dbg !33
  call void @abort() #4, !dbg !35
  unreachable, !dbg !35

7:                                                ; preds = %1
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_616_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !37 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %3, metadata !43, metadata !DIExpression()), !dbg !44
  %5 = load i32, i32* @g1, align 4, !dbg !45
  %6 = add nsw i32 %5, 1, !dbg !46
  store i32 %6, i32* %3, align 4, !dbg !44
  %7 = load i32, i32* %3, align 4, !dbg !47
  store i32 %7, i32* @g1, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %4, metadata !49, metadata !DIExpression()), !dbg !50
  %8 = load i32, i32* @g1, align 4, !dbg !51
  %9 = sub nsw i32 %8, 1, !dbg !52
  store i32 %9, i32* %4, align 4, !dbg !50
  %10 = load i32, i32* %4, align 4, !dbg !53
  store i32 %10, i32* @g1, align 4, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_616_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !56 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %3, metadata !59, metadata !DIExpression()), !dbg !60
  %5 = load i32, i32* @g2, align 4, !dbg !61
  %6 = add nsw i32 %5, 1, !dbg !62
  store i32 %6, i32* %3, align 4, !dbg !60
  %7 = load i32, i32* %3, align 4, !dbg !63
  store i32 %7, i32* @g2, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %4, metadata !65, metadata !DIExpression()), !dbg !66
  %8 = load i32, i32* @g2, align 4, !dbg !67
  %9 = sub nsw i32 %8, 1, !dbg !68
  store i32 %9, i32* %4, align 4, !dbg !66
  %10 = load i32, i32* %4, align 4, !dbg !69
  store i32 %10, i32* @g2, align 4, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_616_001_main() local_unnamed_addr #0 !dbg !72 {
  %1 = load i32, i32* @g1, align 4, !dbg !75
  %2 = icmp eq i32 %1, 0, !dbg !76
  %3 = zext i1 %2 to i32, !dbg !76
  call void @__VERIFIER_assert(i32 %3), !dbg !77
  %4 = load i32, i32* @g1, align 4, !dbg !78
  %5 = icmp eq i32 %4, 0, !dbg !79
  %6 = zext i1 %5 to i32, !dbg !79
  call void @__VERIFIER_assert(i32 %6), !dbg !80
  %7 = load i32, i32* @g2, align 4, !dbg !81
  %8 = icmp eq i32 %7, 0, !dbg !82
  %9 = zext i1 %8 to i32, !dbg !82
  call void @__VERIFIER_assert(i32 %9), !dbg !83
  %10 = load i32, i32* @g1, align 4, !dbg !84
  %11 = icmp eq i32 %10, 0, !dbg !85
  %12 = zext i1 %11 to i32, !dbg !85
  call void @__VERIFIER_assert(i32 %12), !dbg !86
  ret i32 0, !dbg !87
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_616_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_616_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !16, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 2, column: 22, scope: !15)
!19 = !DILocation(line: 2, column: 33, scope: !15)
!20 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !21, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !9}
!23 = !DILocalVariable(name: "cond", arg: 1, scope: !20, file: !8, line: 3, type: !9)
!24 = !DILocation(line: 3, column: 28, scope: !20)
!25 = !DILocation(line: 3, column: 41, scope: !26)
!26 = distinct !DILexicalBlock(scope: !20, file: !8, line: 3, column: 39)
!27 = !DILocation(line: 3, column: 40, scope: !26)
!28 = !DILocation(line: 3, column: 39, scope: !20)
!29 = !DILocation(line: 3, column: 48, scope: !26)
!30 = !DILabel(scope: !31, name: "ERROR", file: !8, line: 3)
!31 = distinct !DILexicalBlock(scope: !26, file: !8, line: 3, column: 48)
!32 = !DILocation(line: 3, column: 50, scope: !31)
!33 = !DILocation(line: 3, column: 58, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !8, line: 3, column: 57)
!35 = !DILocation(line: 3, column: 72, scope: !34)
!36 = !DILocation(line: 3, column: 84, scope: !20)
!37 = distinct !DISubprogram(name: "svp_simple_616_001_isr_1", scope: !8, file: !8, line: 8, type: !38, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!41 = !DILocalVariable(name: "arg", arg: 1, scope: !37, file: !8, line: 8, type: !40)
!42 = !DILocation(line: 8, column: 37, scope: !37)
!43 = !DILocalVariable(name: "tmp1", scope: !37, file: !8, line: 10, type: !9)
!44 = !DILocation(line: 10, column: 7, scope: !37)
!45 = !DILocation(line: 10, column: 14, scope: !37)
!46 = !DILocation(line: 10, column: 17, scope: !37)
!47 = !DILocation(line: 11, column: 8, scope: !37)
!48 = !DILocation(line: 11, column: 6, scope: !37)
!49 = !DILocalVariable(name: "tmp2", scope: !37, file: !8, line: 14, type: !9)
!50 = !DILocation(line: 14, column: 7, scope: !37)
!51 = !DILocation(line: 14, column: 14, scope: !37)
!52 = !DILocation(line: 14, column: 17, scope: !37)
!53 = !DILocation(line: 15, column: 8, scope: !37)
!54 = !DILocation(line: 15, column: 6, scope: !37)
!55 = !DILocation(line: 17, column: 1, scope: !37)
!56 = distinct !DISubprogram(name: "svp_simple_616_001_isr_2", scope: !8, file: !8, line: 19, type: !38, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "arg", arg: 1, scope: !56, file: !8, line: 19, type: !40)
!58 = !DILocation(line: 19, column: 37, scope: !56)
!59 = !DILocalVariable(name: "tmp3", scope: !56, file: !8, line: 21, type: !9)
!60 = !DILocation(line: 21, column: 7, scope: !56)
!61 = !DILocation(line: 21, column: 14, scope: !56)
!62 = !DILocation(line: 21, column: 17, scope: !56)
!63 = !DILocation(line: 22, column: 8, scope: !56)
!64 = !DILocation(line: 22, column: 6, scope: !56)
!65 = !DILocalVariable(name: "tmp4", scope: !56, file: !8, line: 25, type: !9)
!66 = !DILocation(line: 25, column: 7, scope: !56)
!67 = !DILocation(line: 25, column: 14, scope: !56)
!68 = !DILocation(line: 25, column: 17, scope: !56)
!69 = !DILocation(line: 26, column: 8, scope: !56)
!70 = !DILocation(line: 26, column: 6, scope: !56)
!71 = !DILocation(line: 28, column: 1, scope: !56)
!72 = distinct !DISubprogram(name: "svp_simple_616_001_main", scope: !8, file: !8, line: 30, type: !73, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!9}
!75 = !DILocation(line: 31, column: 21, scope: !72)
!76 = !DILocation(line: 31, column: 24, scope: !72)
!77 = !DILocation(line: 31, column: 3, scope: !72)
!78 = !DILocation(line: 33, column: 21, scope: !72)
!79 = !DILocation(line: 33, column: 24, scope: !72)
!80 = !DILocation(line: 33, column: 3, scope: !72)
!81 = !DILocation(line: 35, column: 21, scope: !72)
!82 = !DILocation(line: 35, column: 24, scope: !72)
!83 = !DILocation(line: 35, column: 3, scope: !72)
!84 = !DILocation(line: 37, column: 21, scope: !72)
!85 = !DILocation(line: 37, column: 24, scope: !72)
!86 = !DILocation(line: 37, column: 3, scope: !72)
!87 = !DILocation(line: 39, column: 3, scope: !72)
