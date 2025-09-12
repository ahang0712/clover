; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_324_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_324_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data1 = common local_unnamed_addr global i32 0, align 4, !dbg !0
@data2 = common local_unnamed_addr global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_324_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !20 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %3, metadata !26, metadata !DIExpression()), !dbg !27
  %5 = load i32, i32* @data1, align 4, !dbg !28
  %6 = add nsw i32 %5, 1, !dbg !29
  store i32 %6, i32* %3, align 4, !dbg !27
  %7 = load i32, i32* %3, align 4, !dbg !30
  store i32 %7, i32* @data1, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %8 = load i32, i32* @data2, align 4, !dbg !34
  %9 = add nsw i32 %8, 1, !dbg !35
  store i32 %9, i32* %4, align 4, !dbg !33
  %10 = load i32, i32* %4, align 4, !dbg !36
  store i32 %10, i32* @data2, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_324_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !39 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %3, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i32, i32* @data1, align 4, !dbg !44
  %6 = add nsw i32 %5, 5, !dbg !45
  store i32 %6, i32* %3, align 4, !dbg !43
  %7 = load i32, i32* %3, align 4, !dbg !46
  store i32 %7, i32* @data1, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  %8 = load i32, i32* @data2, align 4, !dbg !50
  %9 = add nsw i32 %8, 5, !dbg !51
  store i32 %9, i32* %4, align 4, !dbg !49
  %10 = load i32, i32* %4, align 4, !dbg !52
  store i32 %10, i32* @data2, align 4, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_324_001_main() local_unnamed_addr #0 !dbg !55 {
  store i32 10, i32* @data1, align 4, !dbg !58
  store i32 10, i32* @data2, align 4, !dbg !59
  %1 = load i32, i32* @data1, align 4, !dbg !60
  %2 = icmp eq i32 %1, 16, !dbg !62
  br i1 %2, label %3, label %8, !dbg !63

3:                                                ; preds = %0
  %4 = load i32, i32* @data2, align 4, !dbg !64
  %5 = icmp eq i32 %4, 5, !dbg !65
  br i1 %5, label %6, label %8, !dbg !66

6:                                                ; preds = %3
  br label %7, !dbg !67

7:                                                ; preds = %6
  call void @llvm.dbg.label(metadata !68), !dbg !70
  call void @reach_error(), !dbg !71
  call void @abort() #4, !dbg !73
  unreachable, !dbg !73

8:                                                ; preds = %3, %0
  ret i32 0, !dbg !74
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data1", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_324_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "data2", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_324_001.c", directory: "/Users/hehang03/code/clover")
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
!20 = distinct !DISubprogram(name: "svp_simple_324_001_isr_1", scope: !8, file: !8, line: 6, type: !21, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DILocalVariable(name: "arg", arg: 1, scope: !20, file: !8, line: 6, type: !23)
!25 = !DILocation(line: 6, column: 38, scope: !20)
!26 = !DILocalVariable(name: "tmp", scope: !20, file: !8, line: 8, type: !9)
!27 = !DILocation(line: 8, column: 7, scope: !20)
!28 = !DILocation(line: 8, column: 13, scope: !20)
!29 = !DILocation(line: 8, column: 19, scope: !20)
!30 = !DILocation(line: 9, column: 11, scope: !20)
!31 = !DILocation(line: 9, column: 9, scope: !20)
!32 = !DILocalVariable(name: "tmp1", scope: !20, file: !8, line: 10, type: !9)
!33 = !DILocation(line: 10, column: 7, scope: !20)
!34 = !DILocation(line: 10, column: 14, scope: !20)
!35 = !DILocation(line: 10, column: 20, scope: !20)
!36 = !DILocation(line: 11, column: 11, scope: !20)
!37 = !DILocation(line: 11, column: 9, scope: !20)
!38 = !DILocation(line: 12, column: 1, scope: !20)
!39 = distinct !DISubprogram(name: "svp_simple_324_001_isr_2", scope: !8, file: !8, line: 15, type: !21, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !39, file: !8, line: 15, type: !23)
!41 = !DILocation(line: 15, column: 38, scope: !39)
!42 = !DILocalVariable(name: "tmp", scope: !39, file: !8, line: 17, type: !9)
!43 = !DILocation(line: 17, column: 7, scope: !39)
!44 = !DILocation(line: 17, column: 13, scope: !39)
!45 = !DILocation(line: 17, column: 19, scope: !39)
!46 = !DILocation(line: 18, column: 11, scope: !39)
!47 = !DILocation(line: 18, column: 9, scope: !39)
!48 = !DILocalVariable(name: "tmp1", scope: !39, file: !8, line: 19, type: !9)
!49 = !DILocation(line: 19, column: 7, scope: !39)
!50 = !DILocation(line: 19, column: 14, scope: !39)
!51 = !DILocation(line: 19, column: 20, scope: !39)
!52 = !DILocation(line: 20, column: 11, scope: !39)
!53 = !DILocation(line: 20, column: 9, scope: !39)
!54 = !DILocation(line: 21, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "svp_simple_324_001_main", scope: !8, file: !8, line: 24, type: !56, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!9}
!58 = !DILocation(line: 27, column: 9, scope: !55)
!59 = !DILocation(line: 28, column: 9, scope: !55)
!60 = !DILocation(line: 30, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !8, line: 30, column: 7)
!62 = !DILocation(line: 30, column: 12, scope: !61)
!63 = !DILocation(line: 30, column: 17, scope: !61)
!64 = !DILocation(line: 30, column: 20, scope: !61)
!65 = !DILocation(line: 30, column: 25, scope: !61)
!66 = !DILocation(line: 30, column: 7, scope: !55)
!67 = !DILocation(line: 31, column: 3, scope: !61)
!68 = !DILabel(scope: !69, name: "ERROR", file: !8, line: 32)
!69 = distinct !DILexicalBlock(scope: !61, file: !8, line: 31, column: 3)
!70 = !DILocation(line: 32, column: 5, scope: !69)
!71 = !DILocation(line: 32, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !8, line: 32, column: 12)
!73 = !DILocation(line: 32, column: 27, scope: !72)
!74 = !DILocation(line: 35, column: 3, scope: !55)
