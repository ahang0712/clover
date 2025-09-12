; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !14 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_1(i8* %0) #0 !dbg !19 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %3, metadata !25, metadata !DIExpression()), !dbg !26
  %4 = load i32, i32* @data, align 4, !dbg !27
  %5 = add nsw i32 %4, 1, !dbg !28
  store i32 %5, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %3, align 4, !dbg !29
  store i32 %6, i32* @data, align 4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_2(i8* %0) #0 !dbg !32 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %3, metadata !35, metadata !DIExpression()), !dbg !36
  %4 = load i32, i32* @data, align 4, !dbg !37
  %5 = add nsw i32 %4, 2, !dbg !38
  store i32 %5, i32* %3, align 4, !dbg !36
  %6 = load i32, i32* %3, align 4, !dbg !39
  store i32 %6, i32* @data, align 4, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_304_001_isr_3(i8* %0) #0 !dbg !42 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !43, metadata !DIExpression()), !dbg !44
  %3 = load i32, i32* @data, align 4, !dbg !45
  %4 = icmp sge i32 %3, 3, !dbg !47
  br i1 %4, label %5, label %7, !dbg !48

5:                                                ; preds = %1
  br label %6, !dbg !49

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !50), !dbg !52
  call void @reach_error(), !dbg !53
  call void @abort() #4, !dbg !55
  unreachable, !dbg !55

7:                                                ; preds = %1
  ret void, !dbg !56
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_304_001_main() #0 !dbg !57 {
  ret i32 0, !dbg !60
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
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
!19 = distinct !DISubprogram(name: "svp_simple_304_001_isr_1", scope: !6, file: !6, line: 6, type: !20, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DILocalVariable(name: "arg", arg: 1, scope: !19, file: !6, line: 6, type: !22)
!24 = !DILocation(line: 6, column: 37, scope: !19)
!25 = !DILocalVariable(name: "tmp", scope: !19, file: !6, line: 8, type: !7)
!26 = !DILocation(line: 8, column: 7, scope: !19)
!27 = !DILocation(line: 8, column: 13, scope: !19)
!28 = !DILocation(line: 8, column: 18, scope: !19)
!29 = !DILocation(line: 9, column: 9, scope: !19)
!30 = !DILocation(line: 9, column: 8, scope: !19)
!31 = !DILocation(line: 11, column: 1, scope: !19)
!32 = distinct !DISubprogram(name: "svp_simple_304_001_isr_2", scope: !6, file: !6, line: 14, type: !20, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocalVariable(name: "arg", arg: 1, scope: !32, file: !6, line: 14, type: !22)
!34 = !DILocation(line: 14, column: 37, scope: !32)
!35 = !DILocalVariable(name: "tmp", scope: !32, file: !6, line: 16, type: !7)
!36 = !DILocation(line: 16, column: 7, scope: !32)
!37 = !DILocation(line: 16, column: 13, scope: !32)
!38 = !DILocation(line: 16, column: 18, scope: !32)
!39 = !DILocation(line: 17, column: 9, scope: !32)
!40 = !DILocation(line: 17, column: 8, scope: !32)
!41 = !DILocation(line: 18, column: 1, scope: !32)
!42 = distinct !DISubprogram(name: "svp_simple_304_001_isr_3", scope: !6, file: !6, line: 21, type: !20, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocalVariable(name: "arg", arg: 1, scope: !42, file: !6, line: 21, type: !22)
!44 = !DILocation(line: 21, column: 37, scope: !42)
!45 = !DILocation(line: 23, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !6, line: 23, column: 7)
!47 = !DILocation(line: 23, column: 12, scope: !46)
!48 = !DILocation(line: 23, column: 7, scope: !42)
!49 = !DILocation(line: 23, column: 17, scope: !46)
!50 = !DILabel(scope: !51, name: "ERROR", file: !6, line: 24)
!51 = distinct !DILexicalBlock(scope: !46, file: !6, line: 23, column: 17)
!52 = !DILocation(line: 24, column: 5, scope: !51)
!53 = !DILocation(line: 24, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !6, line: 24, column: 12)
!55 = !DILocation(line: 24, column: 27, scope: !54)
!56 = !DILocation(line: 26, column: 1, scope: !42)
!57 = distinct !DISubprogram(name: "svp_simple_304_001_main", scope: !6, file: !6, line: 29, type: !58, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!7}
!60 = !DILocation(line: 31, column: 3, scope: !57)
