; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common global i32 0, align 4, !dbg !0
@g2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !20 {
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
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_614_001_isr_1(i8* %0) #0 !dbg !37 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %3, metadata !43, metadata !DIExpression()), !dbg !44
  %7 = load i32, i32* @g1, align 4, !dbg !45
  %8 = add nsw i32 %7, 1, !dbg !46
  store i32 %8, i32* %3, align 4, !dbg !44
  %9 = load i32, i32* %3, align 4, !dbg !47
  store i32 %9, i32* @g1, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %4, metadata !49, metadata !DIExpression()), !dbg !50
  %10 = load i32, i32* @g1, align 4, !dbg !51
  %11 = sub nsw i32 %10, 1, !dbg !52
  store i32 %11, i32* %4, align 4, !dbg !50
  %12 = load i32, i32* %4, align 4, !dbg !53
  store i32 %12, i32* @g1, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %5, metadata !55, metadata !DIExpression()), !dbg !56
  %13 = load i32, i32* @g2, align 4, !dbg !57
  %14 = add nsw i32 %13, 1, !dbg !58
  store i32 %14, i32* %5, align 4, !dbg !56
  %15 = load i32, i32* %5, align 4, !dbg !59
  store i32 %15, i32* @g2, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %6, metadata !61, metadata !DIExpression()), !dbg !62
  %16 = load i32, i32* @g2, align 4, !dbg !63
  %17 = sub nsw i32 %16, 1, !dbg !64
  store i32 %17, i32* %6, align 4, !dbg !62
  %18 = load i32, i32* %6, align 4, !dbg !65
  store i32 %18, i32* @g2, align 4, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_614_001_main() #0 !dbg !68 {
  %1 = load i32, i32* @g1, align 4, !dbg !71
  %2 = icmp eq i32 %1, 0, !dbg !72
  %3 = zext i1 %2 to i32, !dbg !72
  call void @__VERIFIER_assert(i32 %3), !dbg !73
  %4 = load i32, i32* @g1, align 4, !dbg !74
  %5 = icmp eq i32 %4, 0, !dbg !75
  %6 = zext i1 %5 to i32, !dbg !75
  call void @__VERIFIER_assert(i32 %6), !dbg !76
  %7 = load i32, i32* @g2, align 4, !dbg !77
  %8 = icmp eq i32 %7, 0, !dbg !78
  %9 = zext i1 %8 to i32, !dbg !78
  call void @__VERIFIER_assert(i32 %9), !dbg !79
  %10 = load i32, i32* @g1, align 4, !dbg !80
  %11 = icmp eq i32 %10, 0, !dbg !81
  %12 = zext i1 %11 to i32, !dbg !81
  call void @__VERIFIER_assert(i32 %12), !dbg !82
  ret i32 0, !dbg !83
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
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c", directory: "/Users/hehang03/code/clover")
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
!37 = distinct !DISubprogram(name: "svp_simple_614_001_isr_1", scope: !8, file: !8, line: 7, type: !38, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!41 = !DILocalVariable(name: "arg", arg: 1, scope: !37, file: !8, line: 7, type: !40)
!42 = !DILocation(line: 7, column: 37, scope: !37)
!43 = !DILocalVariable(name: "tmp1", scope: !37, file: !8, line: 9, type: !9)
!44 = !DILocation(line: 9, column: 7, scope: !37)
!45 = !DILocation(line: 9, column: 14, scope: !37)
!46 = !DILocation(line: 9, column: 17, scope: !37)
!47 = !DILocation(line: 10, column: 8, scope: !37)
!48 = !DILocation(line: 10, column: 6, scope: !37)
!49 = !DILocalVariable(name: "tmp2", scope: !37, file: !8, line: 13, type: !9)
!50 = !DILocation(line: 13, column: 7, scope: !37)
!51 = !DILocation(line: 13, column: 14, scope: !37)
!52 = !DILocation(line: 13, column: 17, scope: !37)
!53 = !DILocation(line: 14, column: 8, scope: !37)
!54 = !DILocation(line: 14, column: 6, scope: !37)
!55 = !DILocalVariable(name: "tmp3", scope: !37, file: !8, line: 17, type: !9)
!56 = !DILocation(line: 17, column: 7, scope: !37)
!57 = !DILocation(line: 17, column: 14, scope: !37)
!58 = !DILocation(line: 17, column: 17, scope: !37)
!59 = !DILocation(line: 18, column: 8, scope: !37)
!60 = !DILocation(line: 18, column: 6, scope: !37)
!61 = !DILocalVariable(name: "tmp4", scope: !37, file: !8, line: 21, type: !9)
!62 = !DILocation(line: 21, column: 7, scope: !37)
!63 = !DILocation(line: 21, column: 14, scope: !37)
!64 = !DILocation(line: 21, column: 17, scope: !37)
!65 = !DILocation(line: 22, column: 8, scope: !37)
!66 = !DILocation(line: 22, column: 6, scope: !37)
!67 = !DILocation(line: 24, column: 1, scope: !37)
!68 = distinct !DISubprogram(name: "svp_simple_614_001_main", scope: !8, file: !8, line: 26, type: !69, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!9}
!71 = !DILocation(line: 29, column: 21, scope: !68)
!72 = !DILocation(line: 29, column: 24, scope: !68)
!73 = !DILocation(line: 29, column: 3, scope: !68)
!74 = !DILocation(line: 31, column: 21, scope: !68)
!75 = !DILocation(line: 31, column: 24, scope: !68)
!76 = !DILocation(line: 31, column: 3, scope: !68)
!77 = !DILocation(line: 33, column: 21, scope: !68)
!78 = !DILocation(line: 33, column: 24, scope: !68)
!79 = !DILocation(line: 33, column: 3, scope: !68)
!80 = !DILocation(line: 35, column: 21, scope: !68)
!81 = !DILocation(line: 35, column: 24, scope: !68)
!82 = !DILocation(line: 35, column: 3, scope: !68)
!83 = !DILocation(line: 37, column: 3, scope: !68)
