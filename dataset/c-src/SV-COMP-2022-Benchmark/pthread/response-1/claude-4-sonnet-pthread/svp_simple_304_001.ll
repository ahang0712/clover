; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !13 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !16
  ret void, !dbg !17
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_1(i8* %0) #0 !dbg !18 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %3, metadata !24, metadata !DIExpression()), !dbg !25
  %4 = load i32, i32* @data, align 4, !dbg !26
  %5 = add nsw i32 %4, 1, !dbg !27
  store i32 %5, i32* %3, align 4, !dbg !25
  %6 = load i32, i32* %3, align 4, !dbg !28
  store i32 %6, i32* @data, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_2(i8* %0) #0 !dbg !31 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %3, metadata !34, metadata !DIExpression()), !dbg !35
  %4 = load i32, i32* @data, align 4, !dbg !36
  %5 = add nsw i32 %4, 2, !dbg !37
  store i32 %5, i32* %3, align 4, !dbg !35
  %6 = load i32, i32* %3, align 4, !dbg !38
  store i32 %6, i32* @data, align 4, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_3(i8* %0) #0 !dbg !41 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !42, metadata !DIExpression()), !dbg !43
  %3 = load i32, i32* @data, align 4, !dbg !44
  %4 = icmp sge i32 %3, 3, !dbg !46
  br i1 %4, label %5, label %7, !dbg !47

5:                                                ; preds = %1
  br label %6, !dbg !48

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !49), !dbg !51
  call void @reach_error(), !dbg !52
  call void @abort() #4, !dbg !54
  unreachable, !dbg !54

7:                                                ; preds = %1
  ret void, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_304_001_main() #0 !dbg !56 {
  ret i32 0, !dbg !59
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !14, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocation(line: 2, column: 22, scope: !13)
!17 = !DILocation(line: 2, column: 33, scope: !13)
!18 = distinct !DISubprogram(name: "svp_simple_304_001_isr_1", scope: !6, file: !6, line: 6, type: !19, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "arg", arg: 1, scope: !18, file: !6, line: 6, type: !21)
!23 = !DILocation(line: 6, column: 37, scope: !18)
!24 = !DILocalVariable(name: "tmp", scope: !18, file: !6, line: 8, type: !7)
!25 = !DILocation(line: 8, column: 7, scope: !18)
!26 = !DILocation(line: 8, column: 13, scope: !18)
!27 = !DILocation(line: 8, column: 18, scope: !18)
!28 = !DILocation(line: 9, column: 9, scope: !18)
!29 = !DILocation(line: 9, column: 8, scope: !18)
!30 = !DILocation(line: 11, column: 1, scope: !18)
!31 = distinct !DISubprogram(name: "svp_simple_304_001_isr_2", scope: !6, file: !6, line: 14, type: !19, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocalVariable(name: "arg", arg: 1, scope: !31, file: !6, line: 14, type: !21)
!33 = !DILocation(line: 14, column: 37, scope: !31)
!34 = !DILocalVariable(name: "tmp", scope: !31, file: !6, line: 16, type: !7)
!35 = !DILocation(line: 16, column: 7, scope: !31)
!36 = !DILocation(line: 16, column: 13, scope: !31)
!37 = !DILocation(line: 16, column: 18, scope: !31)
!38 = !DILocation(line: 17, column: 9, scope: !31)
!39 = !DILocation(line: 17, column: 8, scope: !31)
!40 = !DILocation(line: 18, column: 1, scope: !31)
!41 = distinct !DISubprogram(name: "svp_simple_304_001_isr_3", scope: !6, file: !6, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocalVariable(name: "arg", arg: 1, scope: !41, file: !6, line: 21, type: !21)
!43 = !DILocation(line: 21, column: 37, scope: !41)
!44 = !DILocation(line: 23, column: 7, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !6, line: 23, column: 7)
!46 = !DILocation(line: 23, column: 12, scope: !45)
!47 = !DILocation(line: 23, column: 7, scope: !41)
!48 = !DILocation(line: 23, column: 17, scope: !45)
!49 = !DILabel(scope: !50, name: "ERROR", file: !6, line: 24)
!50 = distinct !DILexicalBlock(scope: !45, file: !6, line: 23, column: 17)
!51 = !DILocation(line: 24, column: 5, scope: !50)
!52 = !DILocation(line: 24, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !6, line: 24, column: 12)
!54 = !DILocation(line: 24, column: 27, scope: !53)
!55 = !DILocation(line: 26, column: 1, scope: !41)
!56 = distinct !DISubprogram(name: "svp_simple_304_001_main", scope: !6, file: !6, line: 29, type: !57, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!7}
!59 = !DILocation(line: 31, column: 3, scope: !56)
