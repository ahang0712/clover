; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_513_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_513_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_513_001_isr_1(i8* %0) #0 !dbg !13 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !17, metadata !DIExpression()), !dbg !18
  %3 = load i32, i32* @glob, align 4, !dbg !19
  %4 = add nsw i32 %3, 1, !dbg !19
  store i32 %4, i32* @glob, align 4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_513_001_main() #0 !dbg !21 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !26
  store i32 %2, i32* %1, align 4, !dbg !25
  %3 = load i32, i32* %1, align 4, !dbg !27
  %4 = icmp ne i32 %3, 0, !dbg !27
  br i1 %4, label %5, label %7, !dbg !29

5:                                                ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0)), !dbg !30
  br label %7, !dbg !30

7:                                                ; preds = %5, %0
  %8 = load i32, i32* %1, align 4, !dbg !31
  %9 = icmp ne i32 %8, 0, !dbg !31
  br i1 %9, label %10, label %13, !dbg !33

10:                                               ; preds = %7
  %11 = load i32, i32* @glob, align 4, !dbg !34
  %12 = add nsw i32 %11, 1, !dbg !34
  store i32 %12, i32* @glob, align 4, !dbg !34
  br label %13, !dbg !35

13:                                               ; preds = %10, %7
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !36
  ret i32 0, !dbg !37
}

declare i32 @__VERIFIER_nondet_int(...) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_513_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_513_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "svp_simple_513_001_isr_1", scope: !6, file: !6, line: 7, type: !14, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "arg", arg: 1, scope: !13, file: !6, line: 7, type: !16)
!18 = !DILocation(line: 7, column: 37, scope: !13)
!19 = !DILocation(line: 9, column: 7, scope: !13)
!20 = !DILocation(line: 11, column: 1, scope: !13)
!21 = distinct !DISubprogram(name: "svp_simple_513_001_main", scope: !6, file: !6, line: 13, type: !22, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{!7}
!24 = !DILocalVariable(name: "i", scope: !21, file: !6, line: 14, type: !7)
!25 = !DILocation(line: 14, column: 7, scope: !21)
!26 = !DILocation(line: 14, column: 11, scope: !21)
!27 = !DILocation(line: 16, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !6, line: 16, column: 7)
!29 = !DILocation(line: 16, column: 7, scope: !21)
!30 = !DILocation(line: 17, column: 3, scope: !28)
!31 = !DILocation(line: 18, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !21, file: !6, line: 18, column: 7)
!33 = !DILocation(line: 18, column: 7, scope: !21)
!34 = !DILocation(line: 19, column: 9, scope: !32)
!35 = !DILocation(line: 19, column: 5, scope: !32)
!36 = !DILocation(line: 20, column: 3, scope: !21)
!37 = !DILocation(line: 22, column: 3, scope: !21)
