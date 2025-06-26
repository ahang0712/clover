; ModuleID = 'svp_simple_004_001.bc'
source_filename = "./svp_simple_004_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_004_001_condition1 = global i32 1, align 4
@svp_simple_004_001_condition2 = global i32 1, align 4
@svp_simple_004_001_condition3 = global i32 1, align 4
@svp_simple_004_001_condition4 = global i32 1, align 4
@svp_simple_004_001_condition5 = global i32 1, align 4
@svp_simple_004_001_condition6 = global i32 1, align 4
@svp_simple_004_001_global_var1 = global i32 17, align 4
@svp_simple_004_001_global_var2 = global i32 34, align 4
@svp_simple_004_001_global_var3 = global i32 51, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %7 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !11
  %8 = bitcast i32* %2 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !11
  %9 = bitcast i32* %3 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !12
  %10 = bitcast i32* %4 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !12
  %11 = bitcast i32* %5 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3, !dbg !13
  %12 = bitcast i32* %6 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #3, !dbg !13
  call void @disable_isr(i32 2), !dbg !14
  %13 = load volatile i32, i32* @svp_simple_004_001_condition1, align 4, !dbg !15, !tbaa !16
  %14 = icmp eq i32 %13, 1, !dbg !20
  br i1 %14, label %15, label %18, !dbg !15

15:                                               ; preds = %0
  %16 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !21, !tbaa !16
  store i32 %16, i32* %1, align 4, !dbg !22, !tbaa !16
  %17 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !23, !tbaa !16
  store i32 %17, i32* %5, align 4, !dbg !24, !tbaa !16
  br label %18, !dbg !25

18:                                               ; preds = %15, %0
  %19 = load volatile i32, i32* @svp_simple_004_001_condition2, align 4, !dbg !26, !tbaa !16
  %20 = icmp eq i32 %19, 1, !dbg !27
  br i1 %20, label %21, label %24, !dbg !26

21:                                               ; preds = %18
  %22 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !28, !tbaa !16
  store i32 %22, i32* %2, align 4, !dbg !29, !tbaa !16
  %23 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !30, !tbaa !16
  store i32 %23, i32* %6, align 4, !dbg !31, !tbaa !16
  br label %24, !dbg !32

24:                                               ; preds = %21, %18
  %25 = load volatile i32, i32* @svp_simple_004_001_condition4, align 4, !dbg !33, !tbaa !16
  %26 = icmp eq i32 %25, 1, !dbg !34
  br i1 %26, label %27, label %29, !dbg !33

27:                                               ; preds = %24
  %28 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !35, !tbaa !16
  store i32 %28, i32* %3, align 4, !dbg !36, !tbaa !16
  br label %29, !dbg !37

29:                                               ; preds = %27, %24
  %30 = load volatile i32, i32* @svp_simple_004_001_condition5, align 4, !dbg !38, !tbaa !16
  %31 = icmp eq i32 %30, 1, !dbg !39
  br i1 %31, label %32, label %34, !dbg !38

32:                                               ; preds = %29
  %33 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !40, !tbaa !16
  store i32 %33, i32* %4, align 4, !dbg !41, !tbaa !16
  br label %34, !dbg !42

34:                                               ; preds = %32, %29
  %35 = bitcast i32* %6 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3, !dbg !43
  %36 = bitcast i32* %5 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3, !dbg !43
  %37 = bitcast i32* %4 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #3, !dbg !43
  %38 = bitcast i32* %3 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3, !dbg !43
  %39 = bitcast i32* %2 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #3, !dbg !43
  %40 = bitcast i32* %1 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3, !dbg !43
  ret void, !dbg !43
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_isr_1() #0 !dbg !44 {
  store volatile i32 0, i32* @svp_simple_004_001_condition6, align 4, !dbg !45, !tbaa !16
  %1 = load volatile i32, i32* @svp_simple_004_001_condition3, align 4, !dbg !46, !tbaa !16
  %2 = icmp eq i32 %1, 1, !dbg !47
  br i1 %2, label %3, label %4, !dbg !46

3:                                                ; preds = %0
  store volatile i32 170, i32* @svp_simple_004_001_global_var1, align 4, !dbg !48, !tbaa !16
  br label %5, !dbg !49

4:                                                ; preds = %0
  store volatile i32 204, i32* @svp_simple_004_001_global_var3, align 4, !dbg !50, !tbaa !16
  br label %5

5:                                                ; preds = %4, %3
  call void @enable_isr(i32 2), !dbg !51
  ret void, !dbg !52
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_isr_2() #0 !dbg !53 {
  %1 = load volatile i32, i32* @svp_simple_004_001_condition6, align 4, !dbg !54, !tbaa !16
  %2 = icmp eq i32 %1, 1, !dbg !55
  br i1 %2, label %3, label %4, !dbg !54

3:                                                ; preds = %0
  store volatile i32 34, i32* @svp_simple_004_001_global_var2, align 4, !dbg !56, !tbaa !16
  br label %4, !dbg !57

4:                                                ; preds = %3, %0
  ret void, !dbg !58
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_004_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_004")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_004_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_004")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 34, column: 3, scope: !7)
!11 = !DILocation(line: 35, column: 3, scope: !7)
!12 = !DILocation(line: 36, column: 3, scope: !7)
!13 = !DILocation(line: 37, column: 3, scope: !7)
!14 = !DILocation(line: 38, column: 3, scope: !7)
!15 = !DILocation(line: 40, column: 7, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 40, column: 37, scope: !7)
!21 = !DILocation(line: 41, column: 15, scope: !7)
!22 = !DILocation(line: 41, column: 13, scope: !7)
!23 = !DILocation(line: 42, column: 15, scope: !7)
!24 = !DILocation(line: 42, column: 13, scope: !7)
!25 = !DILocation(line: 43, column: 3, scope: !7)
!26 = !DILocation(line: 45, column: 7, scope: !7)
!27 = !DILocation(line: 45, column: 37, scope: !7)
!28 = !DILocation(line: 46, column: 15, scope: !7)
!29 = !DILocation(line: 46, column: 13, scope: !7)
!30 = !DILocation(line: 47, column: 15, scope: !7)
!31 = !DILocation(line: 47, column: 13, scope: !7)
!32 = !DILocation(line: 48, column: 3, scope: !7)
!33 = !DILocation(line: 50, column: 7, scope: !7)
!34 = !DILocation(line: 50, column: 37, scope: !7)
!35 = !DILocation(line: 50, column: 53, scope: !7)
!36 = !DILocation(line: 50, column: 51, scope: !7)
!37 = !DILocation(line: 50, column: 43, scope: !7)
!38 = !DILocation(line: 52, column: 7, scope: !7)
!39 = !DILocation(line: 52, column: 37, scope: !7)
!40 = !DILocation(line: 52, column: 53, scope: !7)
!41 = !DILocation(line: 52, column: 51, scope: !7)
!42 = !DILocation(line: 52, column: 43, scope: !7)
!43 = !DILocation(line: 53, column: 1, scope: !7)
!44 = distinct !DISubprogram(name: "svp_simple_004_001_isr_1", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 56, column: 33, scope: !44)
!46 = !DILocation(line: 58, column: 7, scope: !44)
!47 = !DILocation(line: 58, column: 37, scope: !44)
!48 = !DILocation(line: 59, column: 36, scope: !44)
!49 = !DILocation(line: 59, column: 5, scope: !44)
!50 = !DILocation(line: 61, column: 36, scope: !44)
!51 = !DILocation(line: 63, column: 3, scope: !44)
!52 = !DILocation(line: 64, column: 1, scope: !44)
!53 = distinct !DISubprogram(name: "svp_simple_004_001_isr_2", scope: !8, file: !8, line: 66, type: !9, scopeLine: 66, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 67, column: 7, scope: !53)
!55 = !DILocation(line: 67, column: 37, scope: !53)
!56 = !DILocation(line: 68, column: 36, scope: !53)
!57 = !DILocation(line: 68, column: 5, scope: !53)
!58 = !DILocation(line: 69, column: 1, scope: !53)
