; ModuleID = 'svp_simple_700_001.bc'
source_filename = "./svp_simple_700_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 42, align 4
@h = global i32 42, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %7, label %5, !dbg !19

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5
  call void @reach_error(), !dbg !21
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

7:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_700_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %4 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5, !dbg !27
  %5 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !28
  store i32 %5, i32* %3, align 4, !dbg !29, !tbaa !13
  %6 = load i32, i32* %3, align 4, !dbg !30, !tbaa !13
  %7 = icmp sgt i32 %6, -1000, !dbg !31
  br i1 %7, label %8, label %13, !dbg !30

8:                                                ; preds = %1
  %9 = load i32, i32* %3, align 4, !dbg !32, !tbaa !13
  store i32 %9, i32* @g, align 4, !dbg !33, !tbaa !13
  %10 = load i32, i32* %3, align 4, !dbg !34, !tbaa !13
  %11 = sub nsw i32 %10, 17, !dbg !35
  store i32 %11, i32* @h, align 4, !dbg !36, !tbaa !13
  %12 = load i32, i32* %3, align 4, !dbg !37, !tbaa !13
  store i32 %12, i32* @h, align 4, !dbg !38, !tbaa !13
  br label %13, !dbg !39

13:                                               ; preds = %8, %1
  %14 = bitcast i32* %3 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5, !dbg !40
  ret void, !dbg !40
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @svp_simple_700_001_isr_2(i8* %0) #0 !dbg !41 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %5 = bitcast i32* %3 to i8*, !dbg !42
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !42
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !43
  store i32 %6, i32* %3, align 4, !dbg !44, !tbaa !13
  %7 = bitcast i32* %4 to i8*, !dbg !45
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #5, !dbg !45
  %8 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !46
  store i32 %8, i32* %4, align 4, !dbg !47, !tbaa !13
  %9 = load i32, i32* @g, align 4, !dbg !48, !tbaa !13
  store i32 %9, i32* %3, align 4, !dbg !49, !tbaa !13
  %10 = load i32, i32* @h, align 4, !dbg !50, !tbaa !13
  store i32 %10, i32* %4, align 4, !dbg !51, !tbaa !13
  %11 = load i32, i32* %4, align 4, !dbg !52, !tbaa !13
  %12 = load i32, i32* %3, align 4, !dbg !53, !tbaa !13
  %13 = icmp sle i32 %11, %12, !dbg !54
  %14 = zext i1 %13 to i32, !dbg !54
  call void @__VERIFIER_assert(i32 %14), !dbg !55
  %15 = bitcast i32* %4 to i8*, !dbg !56
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #5, !dbg !56
  %16 = bitcast i32* %3 to i8*, !dbg !56
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5, !dbg !56
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_700_001_main() #0 !dbg !57 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !58
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5, !dbg !58
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !59
  store i32 %4, i32* %1, align 4, !dbg !60, !tbaa !13
  %5 = bitcast i32* %2 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !61
  %6 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !62
  store i32 %6, i32* %2, align 4, !dbg !63, !tbaa !13
  %7 = load i32, i32* @g, align 4, !dbg !64, !tbaa !13
  store i32 %7, i32* %1, align 4, !dbg !65, !tbaa !13
  %8 = load i32, i32* @h, align 4, !dbg !66, !tbaa !13
  store i32 %8, i32* %2, align 4, !dbg !67, !tbaa !13
  %9 = load i32, i32* %2, align 4, !dbg !68, !tbaa !13
  %10 = load i32, i32* %1, align 4, !dbg !69, !tbaa !13
  %11 = icmp eq i32 %9, %10, !dbg !70
  %12 = zext i1 %11 to i32, !dbg !70
  call void @__VERIFIER_assert(i32 %12), !dbg !71
  %13 = load i32, i32* %2, align 4, !dbg !72, !tbaa !13
  %14 = load i32, i32* %1, align 4, !dbg !73, !tbaa !13
  %15 = icmp eq i32 %13, %14, !dbg !74
  %16 = zext i1 %15 to i32, !dbg !74
  call void @__VERIFIER_assert(i32 %16), !dbg !75
  %17 = bitcast i32* %2 to i8*, !dbg !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !76
  %18 = bitcast i32* %1 to i8*, !dbg !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #5, !dbg !76
  ret i32 0, !dbg !77
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_700_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_700_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 3, column: 22, scope: !7)
!11 = !DILocation(line: 3, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 4, column: 41, scope: !12)
!18 = !DILocation(line: 4, column: 40, scope: !12)
!19 = !DILocation(line: 4, column: 39, scope: !12)
!20 = !DILocation(line: 4, column: 48, scope: !12)
!21 = !DILocation(line: 4, column: 58, scope: !12)
!22 = !DILocation(line: 4, column: 72, scope: !12)
!23 = !DILocation(line: 4, column: 84, scope: !12)
!24 = distinct !DISubprogram(name: "svp_simple_700_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 15, column: 3, scope: !24)
!28 = !DILocation(line: 15, column: 11, scope: !24)
!29 = !DILocation(line: 15, column: 7, scope: !24)
!30 = !DILocation(line: 16, column: 7, scope: !24)
!31 = !DILocation(line: 16, column: 9, scope: !24)
!32 = !DILocation(line: 17, column: 9, scope: !24)
!33 = !DILocation(line: 17, column: 7, scope: !24)
!34 = !DILocation(line: 18, column: 9, scope: !24)
!35 = !DILocation(line: 18, column: 11, scope: !24)
!36 = !DILocation(line: 18, column: 7, scope: !24)
!37 = !DILocation(line: 20, column: 9, scope: !24)
!38 = !DILocation(line: 20, column: 7, scope: !24)
!39 = !DILocation(line: 22, column: 3, scope: !24)
!40 = !DILocation(line: 24, column: 1, scope: !24)
!41 = distinct !DISubprogram(name: "svp_simple_700_001_isr_2", scope: !8, file: !8, line: 26, type: !9, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 27, column: 3, scope: !41)
!43 = !DILocation(line: 27, column: 11, scope: !41)
!44 = !DILocation(line: 27, column: 7, scope: !41)
!45 = !DILocation(line: 28, column: 3, scope: !41)
!46 = !DILocation(line: 28, column: 11, scope: !41)
!47 = !DILocation(line: 28, column: 7, scope: !41)
!48 = !DILocation(line: 30, column: 7, scope: !41)
!49 = !DILocation(line: 30, column: 5, scope: !41)
!50 = !DILocation(line: 31, column: 7, scope: !41)
!51 = !DILocation(line: 31, column: 5, scope: !41)
!52 = !DILocation(line: 33, column: 21, scope: !41)
!53 = !DILocation(line: 33, column: 26, scope: !41)
!54 = !DILocation(line: 33, column: 23, scope: !41)
!55 = !DILocation(line: 33, column: 3, scope: !41)
!56 = !DILocation(line: 35, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "svp_simple_700_001_main", scope: !8, file: !8, line: 48, type: !9, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 49, column: 3, scope: !57)
!59 = !DILocation(line: 49, column: 11, scope: !57)
!60 = !DILocation(line: 49, column: 7, scope: !57)
!61 = !DILocation(line: 50, column: 3, scope: !57)
!62 = !DILocation(line: 50, column: 11, scope: !57)
!63 = !DILocation(line: 50, column: 7, scope: !57)
!64 = !DILocation(line: 53, column: 7, scope: !57)
!65 = !DILocation(line: 53, column: 5, scope: !57)
!66 = !DILocation(line: 54, column: 7, scope: !57)
!67 = !DILocation(line: 54, column: 5, scope: !57)
!68 = !DILocation(line: 56, column: 21, scope: !57)
!69 = !DILocation(line: 56, column: 26, scope: !57)
!70 = !DILocation(line: 56, column: 23, scope: !57)
!71 = !DILocation(line: 56, column: 3, scope: !57)
!72 = !DILocation(line: 58, column: 21, scope: !57)
!73 = !DILocation(line: 58, column: 26, scope: !57)
!74 = !DILocation(line: 58, column: 23, scope: !57)
!75 = !DILocation(line: 58, column: 3, scope: !57)
!76 = !DILocation(line: 60, column: 1, scope: !57)
!77 = !DILocation(line: 59, column: 3, scope: !57)
