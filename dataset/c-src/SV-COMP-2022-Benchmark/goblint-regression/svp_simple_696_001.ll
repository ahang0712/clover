; ModuleID = 'svp_simple_696_001.c'
source_filename = "svp_simple_696_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !12 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !15
  ret void, !dbg !16
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !17 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !20, metadata !DIExpression()), !dbg !21
  %3 = load i32, i32* %2, align 4, !dbg !22
  %4 = icmp ne i32 %3, 0, !dbg !24
  br i1 %4, label %7, label %5, !dbg !25

5:                                                ; preds = %1
  br label %6, !dbg !26

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !27), !dbg !29
  call void @reach_error(), !dbg !30
  call void @abort() #4, !dbg !32
  unreachable, !dbg !32

7:                                                ; preds = %1
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_696_001_isr_1(i8* %0) #0 !dbg !34 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 2, i32* @g, align 4, !dbg !40
  %3 = load i32, i32* @g, align 4, !dbg !41
  %4 = icmp eq i32 %3, 2, !dbg !42
  %5 = zext i1 %4 to i32, !dbg !42
  call void @__VERIFIER_assert(i32 %5), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_696_001_main() #0 !dbg !45 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %2, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = load i32, i32* @g, align 4, !dbg !52
  store i32 %5, i32* %1, align 4, !dbg !53
  %6 = load i32, i32* @g, align 4, !dbg !54
  store i32 %6, i32* %2, align 4, !dbg !55
  %7 = load i32, i32* %1, align 4, !dbg !56
  %8 = load i32, i32* %2, align 4, !dbg !57
  %9 = icmp eq i32 %7, %8, !dbg !58
  %10 = zext i1 %9 to i32, !dbg !58
  call void @__VERIFIER_assert(i32 %10), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %3, metadata !60, metadata !DIExpression()), !dbg !61
  %11 = load i32, i32* @g, align 4, !dbg !62
  %12 = load i32, i32* %1, align 4, !dbg !63
  %13 = sub nsw i32 %11, %12, !dbg !64
  store i32 %13, i32* %3, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %4, metadata !65, metadata !DIExpression()), !dbg !66
  %14 = load i32, i32* %3, align 4, !dbg !67
  %15 = load i32, i32* @g, align 4, !dbg !68
  %16 = sub nsw i32 %14, %15, !dbg !69
  store i32 %16, i32* %4, align 4, !dbg !66
  %17 = load i32, i32* %4, align 4, !dbg !70
  store i32 %17, i32* @g, align 4, !dbg !71
  ret i32 0, !dbg !72
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 8, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_696_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 3, type: !13, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 3, column: 22, scope: !12)
!16 = !DILocation(line: 3, column: 33, scope: !12)
!17 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !6}
!20 = !DILocalVariable(name: "cond", arg: 1, scope: !17, file: !3, line: 4, type: !6)
!21 = !DILocation(line: 4, column: 28, scope: !17)
!22 = !DILocation(line: 4, column: 41, scope: !23)
!23 = distinct !DILexicalBlock(scope: !17, file: !3, line: 4, column: 39)
!24 = !DILocation(line: 4, column: 40, scope: !23)
!25 = !DILocation(line: 4, column: 39, scope: !17)
!26 = !DILocation(line: 4, column: 48, scope: !23)
!27 = !DILabel(scope: !28, name: "ERROR", file: !3, line: 4)
!28 = distinct !DILexicalBlock(scope: !23, file: !3, line: 4, column: 48)
!29 = !DILocation(line: 4, column: 50, scope: !28)
!30 = !DILocation(line: 4, column: 58, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 4, column: 57)
!32 = !DILocation(line: 4, column: 72, scope: !31)
!33 = !DILocation(line: 4, column: 84, scope: !17)
!34 = distinct !DISubprogram(name: "svp_simple_696_001_isr_1", scope: !3, file: !3, line: 11, type: !35, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!38 = !DILocalVariable(name: "arg", arg: 1, scope: !34, file: !3, line: 11, type: !37)
!39 = !DILocation(line: 11, column: 37, scope: !34)
!40 = !DILocation(line: 13, column: 5, scope: !34)
!41 = !DILocation(line: 14, column: 21, scope: !34)
!42 = !DILocation(line: 14, column: 23, scope: !34)
!43 = !DILocation(line: 14, column: 3, scope: !34)
!44 = !DILocation(line: 15, column: 1, scope: !34)
!45 = distinct !DISubprogram(name: "svp_simple_696_001_main", scope: !3, file: !3, line: 17, type: !46, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!6}
!48 = !DILocalVariable(name: "x", scope: !45, file: !3, line: 18, type: !6)
!49 = !DILocation(line: 18, column: 7, scope: !45)
!50 = !DILocalVariable(name: "y", scope: !45, file: !3, line: 18, type: !6)
!51 = !DILocation(line: 18, column: 10, scope: !45)
!52 = !DILocation(line: 19, column: 7, scope: !45)
!53 = !DILocation(line: 19, column: 5, scope: !45)
!54 = !DILocation(line: 20, column: 7, scope: !45)
!55 = !DILocation(line: 20, column: 5, scope: !45)
!56 = !DILocation(line: 21, column: 21, scope: !45)
!57 = !DILocation(line: 21, column: 26, scope: !45)
!58 = !DILocation(line: 21, column: 23, scope: !45)
!59 = !DILocation(line: 21, column: 3, scope: !45)
!60 = !DILocalVariable(name: "tmp", scope: !45, file: !3, line: 23, type: !6)
!61 = !DILocation(line: 23, column: 7, scope: !45)
!62 = !DILocation(line: 23, column: 13, scope: !45)
!63 = !DILocation(line: 23, column: 15, scope: !45)
!64 = !DILocation(line: 23, column: 14, scope: !45)
!65 = !DILocalVariable(name: "tmp1", scope: !45, file: !3, line: 24, type: !6)
!66 = !DILocation(line: 24, column: 7, scope: !45)
!67 = !DILocation(line: 24, column: 14, scope: !45)
!68 = !DILocation(line: 24, column: 19, scope: !45)
!69 = !DILocation(line: 24, column: 18, scope: !45)
!70 = !DILocation(line: 25, column: 7, scope: !45)
!71 = !DILocation(line: 25, column: 5, scope: !45)
!72 = !DILocation(line: 27, column: 3, scope: !45)
